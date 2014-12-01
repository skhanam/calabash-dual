@android_test @ios_test @myaccount_tests  @de @auto3
Feature: Read Bookings Details and Verify
  Verify welcome text for bookings in past
  Verify Add booking page

  #Phone tests working fine
  @myaccount_tests1
  Scenario: Verify welcome text for bookings in past
    Given I am on my bookings page
    When I switch to a booking in past
    Then I verify welcome message for booking in past
