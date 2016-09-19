Feature: Search for articles
  In order to make informed decisions
  As a registered user of SERLER
  I want to search for empirical evidence on different methods based on different constraints

  Scenario: Basic search - Found articles
    Given I have opened "http://localhost:3000/search_queries"
    When I search for title contains "Agile"
    Then I should see a list of articles with title contain "Agile"

  Scenario: Basic search - Not found articles
    Given I have opened "http://localhost:3000/search_queries"
    When I search for title contains "Pizza"
    Then I should not see a list of articles with title contain "Pizza"

  Scenario: Advance search - Go to new advance search
    Given I have opened "http://localhost:3000/search_queries"
    When I click on "Advance Search"
    Then I should be on new query page with title "New Search Query"

  Scenario: Advance search - Start date
    Given I have opened "http://localhost:3000/search_queries"
    When I click on "Advance Search"
    Then I can see the calender with the default start date "1990", and end date "2016"

  Scenario: Advance search - Add more search condition
    Given I am on the link: "http://localhost:3000/search_queries/new"
    When I click the add button twice
    Then I can see 3 set of query

  Scenario: Advance search - Back button
    Given I am on the link: "http://localhost:3000/search_queries/new"
    When I click the back button
    Then I return to the home page with title "Search Result"
