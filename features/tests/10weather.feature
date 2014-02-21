@ios_test @android_test
Feature: Weather
  As a TUI client with a TUI booking
  I should be able to access the destination weather screens
  So I am informed about the current and forecasted weather

  Background:

  @failed
  Scenario: Verify weather screen for Single Booking
    Given I have switched to single booking
    Given I navigate to weather page using weather biscuit
    Then I see holiday weather page

  Scenario:Week's weather
    When I navigate to weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days

  Scenario: Social Share
    Given I am on a the TUI Holiday Weather page
    When I tap on the 'Share the weather' button
    Then I should see an overlay with buttons to social media
      | facebook |
      | Twitter  |