Feature: Login Feature
  In order to view information, I want to be able to login to the systme
  
  Scenario: Login
    Given I go to "/login"
    And I see "Please sign in"
    When I log in as username "robert01011991@gmail.com"
    And my password is "1234"
    And I click on Log in
    Then I go to "/articles"
    # And I see "PENDING ARTICLES"
    
  # Scenario: Edit
  #   Given I go to "/articles/new"
  #   And I see "Source"
    # When I click the "Edit" button
    
  # Scenario: Login
  #   Given I go to "/articles"
  #   And I see "PENDING ARTICLES1"
  #   When I click the "Edit" button
    # Then I see "Research Method"
