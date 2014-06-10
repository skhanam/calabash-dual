@android_test @ios_test @myaccount_tests  @de
Feature: Read Bookings Details and Verify
  Verify welcome text for bookings in past
  Verify Add booking page

  Scenario: Verify welcome text for bookings in past
    Given I am on my bookings page
    When I switch to a booking in past
    Then I verify welcome message for booking in past

  Scenario: Verify Add booking page
    Given I am on my bookings page
    When I navigate to add a booking page
    Then I see add a booking page