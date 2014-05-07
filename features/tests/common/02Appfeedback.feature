@ios_test @android_test  @app-feedback @common-tests
Feature: Verify App feedback page

  @reset
  Scenario: Verify App feedback page
    Given I have home screen with default booking
    When I navigate to App feedback page
    Then I see app feedback page

  Scenario: Verify App feedback page
    Given I have home screen with default booking
    When I navigate to App feedback page
    And  I submit default rating App feedback page
    Then verify rating submitted message

