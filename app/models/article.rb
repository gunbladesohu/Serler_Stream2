class Article < ActiveRecord::Base

  # Trung - Define model associations
  has_many :articles_research_participants
  has_many :research_participants, through: :articles_research_participants
  accepts_nested_attributes_for :research_participants
  has_many :ratings
  has_many :article_users
  has_many :users, through: :article_users
  has_many :articles_authors
  has_many :authors, through: :articles_authors
  has_many :articles_research_methods
  has_many :research_methods, through: :articles_research_methods
  accepts_nested_attributes_for :research_methods
  has_many :articles_dev_methods
  has_many :dev_methods, through: :articles_dev_methods
  accepts_nested_attributes_for :dev_methods
  has_many :articles_methodologies
  has_many :methodologies, through: :articles_methodologies
    accepts_nested_attributes_for :methodologies

  belongs_to :status, foreign_key: :status_id
  belongs_to :article_type, foreign_key: :type_id
  belongs_to :user, foreign_key: :user_id

  attr_accessor :authors

  scope :search_by, -> (key, operator, value) {
    case operator
      when 1 # contains
        arel_table[key].matches "%#{value}%"
      when 2 # does not contains
        arel_table[key].does_not_match "%#{value}%"
      when 3 # begins with
        arel_table[key].matches "#{value}%"
      when 4 # end with
        arel_table[key].matches "%#{value}"
      when 5 # is equal to
        arel_table[key].eq value
      when 6 # is less than
        arel_table[key].lt value
      when 7 # is less than or equal
        arel_table[key].lteq value
      when 8 # is more than
        arel_table[key].gt value
      when 9 # is more than or equal
        arel_table[key].gteq value
    end
  }

  # pavan primary search in the search page
  def self.search(search)
    if search
      search = search.strip
      # where(["title LIKE ?","%#{search}%"])
      where(arel_table[:title].matches "%#{search}%")
    else
      all
    end
  end

  scope :user_filter, ->(user_id){
    joins(:users).where('users.id = ?', user_id) if user_id.present?
  }

end
