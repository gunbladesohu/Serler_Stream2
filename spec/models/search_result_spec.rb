require 'rails_helper'

RSpec.describe SearchResult, type: :model do
	context "search result" do
	    it "save search result" do
	      search_result = SearchResult.create!
	      detail1 = search_result.search_result_details.create!(:article_url => "url1", :article_id => 1)
	      detail2 = search_result.search_result_details.create!(:article_url => "url2", :article_id => 2)
	      expect(search_result.reload.search_result_details).to eq([detail1, detail2])
	    end
  	end
end
