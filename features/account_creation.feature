Feature: User Account Creation

  Scenario: Happy Path
    Given I do not have an account on the site
    When I visit the site root path
    Then I am presented with a login page
    When I click the "Sign up" link
    And I enter my email address
    And I enter a password with correct confirmation
    And I click the "Sign up" button
    And I am redirected to the crops index page

  Scenario: Invalid Password
    Given I do not have an account on the site
    When I visit the site root path
    Then I am presented with a login page
    When I click the "Sign up" link
    And I enter my email address
    And I enter a password with incorrect confirmation
    And I click the "Sign up" button
    Then I am notified that my password confirmation does not match

  Scenario: Invalid Email Format
    Given I do not have an account on the site
    When I visit the site root path
    Then I am presented with a login page
    When I click the "Sign up" link
    And I enter "garbage" as my email address
    And I enter a password with correct confirmation
    And I click the "Sign up" button
    Then I am notified that my email address is invalid.
