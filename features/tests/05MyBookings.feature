@android_test @ios_test @myaccount_tests
Feature: Read Bookings Details and Verify
  Verify welcome text for bookings in past
  Verify Add booking page

  Background:
    Given I am on my bookings page


  Scenario: Verify welcome text for bookings in past
    When I switch to a booking in past
    Then I verify welcome message for booking in past

  Scenario: Verify Add booking page
    When I navigate to add a booking page
    Then I see add a booking page

#  Scenario: Read booking details from my bookings page
#    Given I am on my bookings page
#    And read my bookings into user details




