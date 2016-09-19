# ----------------------Basic search - quick search with title

# Navigate to search quries home page
Given(/^I have opened "([^"]*)"$/) do |url|
  visit url
end

# Enter search query
When(/^I search for title contains "([^"]*)"$/) do |query|
  fill_in "quick_search", :with => query
  click_button "Go!"
end

# The result - should find related articles
Then(/^I should see a list of articles with title contain "([^"]*)"$/) do |text|
  page.should have_content(text)
end

# The result - should not find the related articles
Then(/^I should not see a list of articles with title contain "([^"]*)"$/) do |text|
  page.should have_no_content(text)
end

# ----------------------Advance search - Go to new advance search

# Click advance search button
When(/^I click on "([^"]*)"$/) do |button|
  click_link button
end

# The result - should show the new query page
Then(/^I should be on new query page with title "([^"]*)"$/) do |title|
  page.should have_content(title)
end

# ----------------------Advance search - Start & end date select

# The result - should show start date and end date
Then(/^I can see the calender with the default start date "([^"]*)", and end date "([^"]*)"$/) do |start_d, end_d|
  fill_in('search_query_from_date', with: start_d)
  fill_in('search_query_from_date', with: end_d)
end

# ----------------------Advance search - Add new condition

Given(/^I am on the link: "([^"]*)"$/) do |url|
  visit url
end

When(/^I click the add button twice$/) do
  click_link "add_condition"
  click_link "add_condition"
end

Then(/^I can see 3 set of query$/) do
  page.find(:css, 'fieldset', :count => 3)
end

# ----------------------Advance search - Back button

When(/^I click the back button$/) do
  click_link "Back"
end

Then(/^I return to the home page with title "([^"]*)"$/) do |title|
  page.should have_content(title)
end
