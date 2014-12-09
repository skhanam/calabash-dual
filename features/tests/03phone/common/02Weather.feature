@common-phone  @phone-weather
Feature: Verify weather features

  @week-weather
  Scenario:Week's weather
    Given I am on weather page with single booking
    Then I see holiday weather page
    And I should weather forecast for five sequential days

  @weather2 @working
  Scenario:check share weather
    Given I am on weather page with single booking
    Then I see holiday weather page
    And verify weather sharing text
