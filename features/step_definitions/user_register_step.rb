# ----------------------Access into registration page

# Navigate to home page
Given(/^I open "([^"]*)"$/) do |url|
  visit url
end

# Click on register button
When(/^I click on button contains "([^"]*)"$/) do |query|
  within('.nav'){
      click_on 'Register'
    }
end

# The result - should see the text
Then(/^I should see a page with title contain "([^"]*)"$/) do |text|
  page.should have_content(text)
end

# The result - should not see the text
Then(/^I should not see a page with title contain "([^"]*)"$/) do |text|
  page.should have_no_content(text)
end


# ----------------------Invalid email validation in registration process

# Enter 'abc' as email value
When(/^I enter "([^"]*)" as value of email$/) do |text|
  find('#email').set(text)
  # fill_in "#email", :with => text
  click_button "Register Now"
end

# The result - should see the text
Then(/^I should see a validation with contain "([^"]*)"$/) do |text|
  
  expect(page).to have_selector('#email_val_msg', visible: true)
  
  # expect(page).to have_selector('#email_val_msg', value: text)
  
  # expect(page).should have_content(text)
  # expect(page).to have_selector('#email_val_msg', text: "Please provide a valid email address")
  
  # page.should have_css("span[value='#{text}']")
  
  #page.should have_content(text)
  # page.find("#password_val_msg", :text => text)
  # within('#emailSection'){
  #     page.should have_content "Please provide a valid email address"
  #   }
end


