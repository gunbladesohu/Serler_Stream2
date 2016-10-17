class SearchResult < ActiveRecord::Base

	belongs_to :user
  	has_many :search_result_details
end
