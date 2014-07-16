@android_test @ios_test @common-tests
Feature: Verify contact us page

  @contactus1
  Scenario: Verify contact us page
    Given I am on home screen with default booking
    When I navigate to contact us page using side menu
    Then I verify contact us page
