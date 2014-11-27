#testcases - https://akqa-lon3.ontestpad.com/script/1036
@ios_test @android_test @auto3  @de
Feature: Weather
  As a TUI client with a TUI booking
  I should be able to access the destination weather screens
  So I am informed about the current and forecasted weather

  Scenario:Week's weather
    Given I have switched to single booking
    When I navigate to weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days

  @weather2
  Scenario: Social Share
    Given I have switched to single booking
    Given I navigate to weather page using weather biscuit
    Then I verify share icons on weather page
