Feature: Ideas are at the center

  Scenario: An idea can be created
    Given I am on the home page
    When  I fill in "name" with "This is my idea"
    And   I press "Keep it"
    Then  I should be on a bevy page
    And   I should see "This is my idea" within "ul.idea_list"

  Scenario: An idea can be modified
    Given I am on the home page
    When  I fill in "name" with "This is my idea"
    And   I press "Keep it"
    And   I follow "This is my idea" within "ul.idea_list"
    Then  I should be on the edit page for "This is my idea"
    When  I fill in "name" with "a new idea"
    And   I press "Keep it"
    Then  I should be on the bevy page for "a new idea"
    And   I should see "a new idea" within "ul.idea_list"

  @javascript
  Scenario: An idea can be deleted
    Given I am on the home page
    When  I fill in "name" with "This is my idea"
    And   I press "Keep it"
    Then  I should be on a bevy page
    And   I should see "This is my idea" within "ul.idea_list"
    When  I am going to confirm all js popups on this page
    And   I follow "This is my idea"'s delete link
    Then  I should be on a bevy page
    And   I should not see "This is my idea" within "ul.idea_list"

  Scenario: Visiting the home page
    Given there are 0 bevys
    When  I go to the home page
    Then  there should be 1 bevy
    And   I should see "about" within ".top_nav_wrapper"

  Scenario: Visiting the about page
    Given I am on the home page
    When  I follow "about"
    Then  I should be on the about page
    And   I should see "Adam Bachman"


