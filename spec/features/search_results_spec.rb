require 'rails_helper'

RSpec.feature "SaveSearchResult", type: :feature do
  before :each do
    visit new_search_query_path
    click_button "Start Search"
    expect(page).to have_current_path(search_queries_path)
    # sleep 1
    # find('#save_result').click
    # find('sv_rs').click
    click_button "sv_rs"
  end

  let(:output){double('output').as_null_object}

  it "have save results button on search results page" do
    # expect(page).to redirect_to()

    expect(page).to have_button('Save Result',visible: true)
  end

  context "Save Result popup" do


    it "description cannot be nil" do
      # expect("div#description").to be_valid
    end

    it "popup modal when click save results button" do
      expect(page).to have_content("Save Result")
      expect(page).to have_content("Description")
    end

    it "cancel the save results process" do
      click_button "rs_close_btn"
      expect(page).to have_current_path("/search_queries")
    end

    it "write description and click save button on save results popup" do
      page.has_css?('.modal')
      page.has_css?('description')
      fill_in "description", :with => "test"
      find('input[value="Save Results"]').click
      expect(page).to have_current_path('/search_queries/queries_result')
    end
  end


end