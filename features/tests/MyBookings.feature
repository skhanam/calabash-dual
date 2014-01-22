@android_test @ios_test
Feature: Read Bookings Details and Verify

  Scenario: Read booking details from my bookings page
    Given I am on Home screen
    When I navigate to my bookings page
    Then I see my bookings page
    And read my bookings into user details


  Scenario: Read booking details from my bookings page
    Given I am on Home screen
    When I navigate to my bookings page
    Then I see my bookings page
    When I click on edit account button from my bookings page
    Then I see my account page


  Scenario: Read booking details from my bookings page
    Given I am on Home screen
    When I navigate to my bookings page
    Then I see my bookings page
    When I click on edit account button from my bookings page
    Then I see my account page
    When I click on change password button from my account page
    Then I see change password page

  @test11
  Scenario: Navigate to past bookings and check welcome text
    Given I am on Home screen
    When I navigate to my bookings page
    Then I see my bookings page
    When I click on booking in past
    Then I see welcome message for booking in past on home screen


