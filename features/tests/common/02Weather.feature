@android_test @ios_test @common-tests

Feature: Verify weather features

  @week-weather
  Scenario:Week's weather
    Given I am on home screen with single booking
    And I am on weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days

  @weather2
  Scenario:check share weather
    Given I am on home screen with single booking
    And I am on weather page
    Then I see holiday weather page
    And I verify share icons are visible
