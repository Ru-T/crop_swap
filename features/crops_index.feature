Feature: Crops index page
  Scenario: Crops pagination
    Given there are 36 crops in the database
    And I have an account on the site
    And I am logged into the site
    Then I see a list of crops in the database
    And the list of 36 crops are paginated in pages of 12 books per page

@wip
  Scenario: Crop Sorting
    Given there are 100 crops in the database
    And I have an account on the site
    And I am logged into the site
    And I sort the crops by "Newest"
    Then the crops are sorted based on when they were posted
    And I sort the crops by "Ripe Now"
    Then the crops are sorted by ripe on date
    And I sort the crops by "Expires Soon"
    Then the crops are sorted by expiry date

@wip
  Scenario: View ripe and expiry dates
    Given there are 100 crops in the database
    And I have an account on the site
    And I am logged into the site
    Then I see if a crop is ripe
    And I see when a crop is about to expire
