Feature: Crops wishlist
  Scenario: Wishlist a crop from index page
    Given there are 100 crops in the database
    And I am logged into the site
    When I visit the site root path
    Then I see a list of crops in the database
    And I wishlist one of the crops
    Then I visit my wishlist page
    And I see the wishlisted crop

  Scenario: Wishlist a crop from a user profile
    Given there are 100 crops in the database
    And I am logged into the site
    When I visit the site root path
    Then I see a list of crops in the database
    And I view one of the crops
    And I wishlist one of the crops
    Then I visit my wishlist page
    And I see the wishlisted crop

  Scenario: Remove from wishlist
    Given I am logged into the site
    And I have wishlisted a crop
    When I visit my wishlist page
    Then I see a wishlisted crop
    And I remove the crop from my wishlist
    Then I no longer see the wishlisted crop
