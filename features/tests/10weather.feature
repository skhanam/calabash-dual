@ios_test @android_test
Feature: Weather
  As a TUI client with a TUI booking
  I should be able to access the destination weather screens
  So I am informed about the current and forecasted weather

  Background:

  Scenario: Verify weather screen for Single Booking
    Given I have switched to single booking
    Given I navigate to weather page using weather biscuit
    Then I see holiday weather page

  Scenario:Week's weather
    When I navigate to weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days

  Scenario: Social Share
    Given I navigate to weather page using weather biscuit
    Then I verify facebook and twitter share icons are visible
