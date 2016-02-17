Feature: Crop Creation
  Scenario: Post a crop
    Given I have an account on the site
    And I am logged into the site
    And I click the "Post A Crop" button
    #When I select a crop type
    And I enter a description
    #And I upload a crop pic
    Then I enter a crop weight
    #And I enter a ripe on date
    #And I enter a expires on date
    And I select what I am willing to swap
    And I click the "Post A Crop" submit button
    And I visit my profile page
    Then I see the crop I just posted

  Scenario: Post an invalid crop
    Given I have an account on the site
    And I am logged into the site
    And I click the "Post A Crop" button
    #When I select a crop type
    And I enter a description
    #And I upload a crop pic
    #And I enter a ripe on date
    #And I enter a expires on date
    And I select what I am willing to swap
    And I click the "Post A Crop" submit button
    Then I see an error that weight can't be blank
