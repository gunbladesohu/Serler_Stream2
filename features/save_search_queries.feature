Feature: save the search queries
  As a registered user
  I want to be able to save any searches I make
  So that I can easily run them again later to save time

  Scenario: save search queries button
    Given I am on the advance search page: "http://localhost:3000/search_queries/new"
    When I click the "Start Search" button
    Then It goes to the page of "Search Result"
    Then It returns search condition "Method Is equal to Test Driven Development"
    When I click the "Save Query" button on the search result page
    Then I can see a popup model with "save query"

  Scenario: save search queries popup
    Given I have click "Save Query" button
    When I write "my query for agile" in the description
    And I click "Save" on the popup model
    Then it returns a message of "Search query was successfully saved"
    And I can see a saved query "my query for agile" on the saved queries page:"http://localhost:3000/search_queries/queries_list"
#
#  Scenario: re_run saved queries
#    Given I am on the page of saved queries:"http://localhost:3000/search_queries/queries_list"
#    And I have at least a saved query with description
    When I click the saved query "my query for agile"
    Then it jumped to the search_result page with content:"Search from"

