Feature: Enter Research Design
  In order to enter article information
  As an analyst
  I want to be able to enter Research Question
  
  Scenario: Pending Articles List
    Given I go to "/login"
    When I log as username "paul@serler.com"
    And my password is "admin123"
    # Given I go to "articles"
    # When I search for title contains "Future Research Directions of Software Engineering and Knowledge Engineering"
  #   When I click on "Edit"
    
  # Scenario: Editing an Article
  #   Given I go to 'articles/27/edit'
  #   When I enter "How to manage Communication" in Research Question
  #   And check if "Case Study" is selected
    
  # Scenario: Saving an Article
  #   Given I go to 'articles/28/edit'
  #   And I click on "Update"
  #   Then I go to 'articles/28'
    
  # Scenario: Successful Save
  #   Given I go to 'articles/30'
  #   And I click on "Edit"
  #   And I click on "Back"
  #   Then I go to 'articles/30/edit'
  #   Then I go to articles