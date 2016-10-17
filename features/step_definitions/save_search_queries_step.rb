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

Given(/^I have click "([^"]*)" button$/) do |button|
  visit "http://localhost:3000/search_queries/new"
  click_button "Start Search"
  # expect(page).to redirect_to(search_query_path)
  click_button button
end

When(/^I write "([^"]*)" in the description$/) do |des|
  fill_in('search_query_description', :with => des)
end

When(/^I click "([^"]*)" on the popup model$/) do |button|
  click_button button
end

Then(/^it returns a message of "([^"]*)"$/) do |mes|
  expect(page).to have_content(mes)
end

Then(/^I can see a saved query "([^"]*)" on the saved queries page:"([^"]*)"$/) do |exp, url|
  visit url
  expect(page).to have_content(exp)
end


# Given(/^I am on the page of saved queries:"([^"]*)"$/) do |url|
#   visit url
# end
#
# Given(/^I have at least a saved query with description$/) do
#   expect(page).to have_selector("table#result-table")
#   expect(page).to have_content("Description")
# end

# ??????????????????????????????????????????????



# When(/^I click the saved query "([^"]*)"$/) do |des|
#   expect(page).to have_link(des)
#   click_link(des)
# end

# Then(/^it jumped to the search_result page with content:"([^"]*)"$/) do |content|
#   expect(page).to have_content(content)
#   expect(page).to have_button("Update Description")
# end

