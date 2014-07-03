@ios_test @android_test @common-tests

Feature: Verify booking summary page

  @booking1 @basic-sanity
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page
    Then I see and verify holiday booking summary page

  @booking_summary1 @basic-sanity
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page
    And list of my flights in booking summary

  @booking_summary2 @basic-sanity
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page
    And list of my hotels in booking summary
