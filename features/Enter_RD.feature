Feature: Enter Research Design
  In order to enter article information
  As an analyst
  I want to be able to enter Research Question
  
  Scenario: Entering Information
    Given I have article titled rails
    When I click on edit
    Then I should be able to enter "Research Design"
   