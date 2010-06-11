Feature: People should see the home page

  Scenario: The home page exists
    Given I am on the home page
    Then  I should be on the home page

  Scenario: The home page has stuff
    Given I am on the home page
    Then  I should see "THIS IS THE INDEX"

  Scenario: I browse to the about page
    Given I am on the home page
    When  I follow "about"
    Then  I should be on the about page
    And   I should see "THIS IS THE ABOUT PAGE"
