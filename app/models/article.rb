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
  has_many :articles_methodologies
  has_many :methodologies, through: :articles_methodologies

  belongs_to :status, foreign_key: :status_id
  belongs_to :article_type, foreign_key: :type_id

  scope :user_filter, ->(user_id){
    joins(:users).where('users.id = ?', user_id) if user_id.present?
  }

end
