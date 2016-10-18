RSpec.feature "SavedSearchResultPage", type: :feature do
  before :each do
    @search_query = SearchQuery.new(from_date: 2011, to_date: 2016, isActive: true)
    @search_query.save!
    @search_results = SearchResult.new(description: "test" , isActive: true)
    @search_results.save!
    visit "/search_queries/queries_result"
  end

  let(:output){double('output').as_null_object}

  it "has Search Result" do
    expect(page).to have_content("Search Result")
  end

  it "test back button" do
    page.has_link?('/search_queries')
  end

  it "results table" do
    page.has_css?('result-table')
    # expect(page).to have_selector("th", :text => "Title")
    page.has_css?("Title")
    page.has_css?("Year")
    page.has_css?("Methodologies")
    page.has_css?("Methods")
    page.has_css?("Research Methods")
    page.has_css?("Participants")
  end
end