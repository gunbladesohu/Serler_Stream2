
Given (/^I go to "([^"]*)"$/) do |page_name|
  visit page_name
end

Given(/^I see "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end

Given(/^I log in as username "([^"]*)"$/) do |arg1|
    fill_in('Email address', :with => arg1)
end

Given(/^my password is "([^"]*)"$/) do |arg1|
  fill_in('Password', :with => arg1)
end

When(/^I click on (.+)?/) do  |button|
  click_button button
end

# When(/^I enter "([^"]*)" in Research Question/) do |text|
#     fill_in('research_methods', :with => text)
#     click_button "Update"
# end

# When (/^check if "([^"]*)" is selected/) do |value|
#     find('article[research_method_ids][]').should be_checked
# end

