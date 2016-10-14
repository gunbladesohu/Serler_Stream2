Given(/^I am on the search queries page: "([^"]*)"$/) do |url|
  visit url
end

When(/^I click browse repository link$/) do
  expect(page).to have_link("Browse Repository")
  click_link('Browse Repository')
  # expect(page).to have_selector("a[href='']")
end

Then(/^I am on the page: "([^"]*)"$/) do |url|
   expect(page).to have_content('Browse Repository')

end

Then(/^I can see all the articles in the database$/) do
  expect(page).to have_content("A review and future direction of agile, business intelligence, analytics and data science")
end

Then(/^All the articles are listed in a tabular format\.$/) do
  expect(page).to have_selector("table#result-table")
  expect(page).to have_selector("th#col0", :text => "Title")
  expect(page).to have_text("Year")
  expect(page).to have_content("Methods")
end
