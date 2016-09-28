require 'uri'
require 'cgi'

Given (/^|I go to (.+)?/) do |page_name|
  visit page_name
end
When(/^I search for title contains "([^"]*)"$/) do |text|
    page.should have_content(text)
end
When(/^I click on (.+)?/) do  |button|
  click_link button
end

When(/^I enter "([^"]*)" in Research Question/) do |text|
    fill_in('research_methods', :with => text)
    click_button "Update"
end

When (/^check if "([^"]*)" is selected/) do |value|
    find('article[research_method_ids][]').should be_checked
end