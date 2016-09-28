Feature: Enter Research Design
  In order to enter article information
  As an analyst
  I want to be able to enter Research Question
  
  Scenario: Pending Articles List
    Given I go to articles
    When I search for title contains "Rails"
    When I click on "Edit"
    
  Scenario: Editing an Article
    Given I go to 'articles/27/edit'
    When I enter "How to manage Communication" in Research Question
    And check if "Case Study" is selected
    
  Scenario: Saving an Article
    Given I go to 'articles/28/edit'
    And I click on "Update"
    Then I go to 'articles/28'
   