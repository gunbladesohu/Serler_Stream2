class Methodology < ActiveRecord::Base

  # Trung - Define model associations
  has_many :articles_methodologies
  has_many :articles, through: :articles_methodologies

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

end
