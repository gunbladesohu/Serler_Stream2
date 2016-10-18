Feature: User registration

  Scenario: Access into registration page
    Given I open "http://localhost:3000/users/"
    When I click on button contains "Register"
    Then I should see a page with title contain "User Registration"
    
   Scenario: Invalid email validation in registration process
    Given I open "http://localhost:3000/users/new"
    When I enter "abc" as value of email
    Then I should see a validation with contain "Please provide a valid email address"

