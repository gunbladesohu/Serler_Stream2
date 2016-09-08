Feature: Search for articles
  In order to make informed decisions
  As a registered user of SERLER
  I want to search for empirical evidence on different methods based on different constraints

  Scenario: Basic search - Found articles
    Given I have opened "http://localhost:3000/search_queries"
    When I search for title contains "Agile"
    Then I should see a list of articles with title contain "Agile"
