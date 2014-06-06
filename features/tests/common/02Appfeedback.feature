@ios_test @android_test  @app-feedback @common-tests @nor
Feature: Verify App feedback page

  @reset @basic-sanity
  Scenario: Verify App feedback page
    Given I am on home screen with default booking
    When I navigate to App feedback page
    Then I see app feedback page

  @app-feedback2 @basic-sanity
  Scenario: Verify App feedback page
    Given I am on home screen with default booking
    When I navigate to App feedback page
    And  I submit default rating App feedback page
    Then verify rating submitted message

