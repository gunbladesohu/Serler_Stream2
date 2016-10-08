
Given (/^I go to "([^"]*)"$/) do |page_name|
  visit page_name
end

# Given(/^I log as username "([^"]*)"$/) do |arg1|
#   fill_in('user.id', :with => arg1)
# end

# Given(/^my password is "([^"]*)"$/) do |arg1|
#   fill_in('password', :with => arg1)
# end

# When(/^I search for title contains "([^"]*)"$/) do |text|
#     expect(page).to have_content(text)
# end
# When(/^I click on (.+)?/) do  |button|
#   click_link button
# end

# When(/^I enter "([^"]*)" in Research Question/) do |text|
#     fill_in('research_methods', :with => text)
#     click_button "Update"
# end

# When (/^check if "([^"]*)" is selected/) do |value|
#     find('article[research_method_ids][]').should be_checked
# end

