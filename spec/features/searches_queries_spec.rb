# require 'rails_helper'

# RSpec.feature "QuickSearches", type: :feature do
#   it "Search for articles with titles contain programming" do
#     visit search_queries_path
#     fill_in "quick_search", :with => "programming"
#     click_button "quick_go"
#     expect(page).to have_text("programming")
#   end

#   it "Search for articles with titles contain Pizza" do
#     visit search_queries_path
#     fill_in "quick_search", :with => "Pizza"
#     click_button "quick_go"
#     expect(page).to have_no_text("No data available in table")
#   end

#   it "Search for articles with empty string" do
#     visit search_queries_path
#     fill_in "quick_search", :with => ""
#     click_button "quick_go"
#     expect(page).to have_no_text("No data available in table")
#   end

#   it "Test advance search button - redirect to new search query page" do
#     visit search_queries_path
#     click_link "Advance Search"
#     current_path.should eq(new_search_query_path)
#     expect(page).to have_text("New Search Query")
#     select('Methodology', :from => 'search_query_search_lines_attributes_0_field_id')
#   end
# end
