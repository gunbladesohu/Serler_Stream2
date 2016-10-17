class SearchResultDetail < ActiveRecord::Base
	 belongs_to :search_result, foreign_key: :search_result_id
	 belongs_to :article , foreign_key: :article_id
end 

