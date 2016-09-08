Given(/^I have opened "([^"]*)"$/) do |url|
  visit url
end

When(/^I search for title contains "([^"]*)"$/) do |query|
  fill_in "quick_search", :with => query
  click_button "Go!"
end

Then(/^I should see a list of articles with title contain "([^"]*)"$/) do |text|
  page.should have_content(text)
end