Feature: Crops wishlist
  Scenario: Wishlist a crop from index page
    Given I have an account on the site
    And I am logged into the site
    And there are 36 crops in the database
    When I visit the site root path
    And I wishlist one of the crops
    Then I visit my wishlisted crops page
    And I see the wishlisted crop
@wip
  Scenario: Wishlist a crop from a user profile
    Given I have an account on the site
    And I am logged into the site
    And there are 100 crops in the database
    When I visit the site root path
    And I view one of the crops
    And I wishlist one of the crops
    Then I visit my wishlisted crops page
    And I see the wishlisted crop
@wip
  Scenario: Remove from wishlist
    Given I have an account on the site
    And I am logged into the site
    And there are 100 crops in the database
    And I have wishlisted a crop
    Then I visit my wishlisted crops page
    Then I see a wishlisted crop
    And I remove the crop from my wishlist
    Then I no longer see the wishlisted crop
