class SearchQuery < ActiveRecord::Base
  belongs_to :user
  has_many :search_lines
  accepts_nested_attributes_for :search_lines, :allow_destroy => true

  attr_accessor :allow_save

end