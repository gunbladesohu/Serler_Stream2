Given(/^I am on the advance search page: "([^"]*)"$/) do |url|
  visit url
end

When(/^I click the "([^"]*)" button$/) do |button|
  click_button button
end

Then(/^It goes to the page of "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^It returns search condition "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

When(/^I click the "([^"]*)" button on the search result page$/) do |button|
  click_button  button
end

# ????????????????????????????????
Then(/^I can see a popup model with "([^"]*)"$/) do |message|
  # @expected_message = message
  expect(page).to have_selector("div#save_query", visible: true)
end

Given(/^I am on the page of saved queries:"([^"]*)"$/) do |url|
  visit url
end

Given(/^I have at least a saved query with description$/) do
  expect(page).to have_selector("table#result-table")
end

# ??????????????????????????????????????????????
When(/^I click the first one with link: "([^"]*)"$/) do |url|
  # find_link(url)
  # expect(page).to have_link("1")
  # click_link(url)
  # page.find(:css, 'a[href="/search_queries/1"]').click
end

Then(/^it jumped to the search_result page with content:"([^"]*)"$/) do |content|
  # page.should have_content(content)
end

