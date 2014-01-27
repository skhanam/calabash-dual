@android_test @ios_test @myaccount_tests
Feature: Read Bookings Details and Verify

  Scenario: Read booking details from my bookings page
    Given I am on my bookings page
    And read my bookings into user details


  Scenario: Navigate to past bookings and check welcome text
    Given I am on my bookings page
    When I select a booking in past
    Then I see welcome message for booking in past on home screen


  Scenario: Verify Add booking page from my bookings
    Given I am on my bookings page
    When I select add a booking button
    Then I see add a booking page






