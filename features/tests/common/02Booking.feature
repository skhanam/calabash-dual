@ios_test @android_test @common-tests

Feature: Verify booking summary page

  @booking1 @basic-sanity
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page