Given(/^I have article titled rails$/) do
  visit articles_url
end

When(/^I click on edit$/) do
  click_link edit_author_path
  
end

Then(/^I should be able to enter "([^"]*)"$/) do |text|
   expect(page).to have_content("Research Design")
end

