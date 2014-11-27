@android_test @ios_test @weather @sanity
Feature: Verify weather features

  @home-weather3
  Scenario: US16737 Verify Weather Biscuit
    Given I am on weather page
    Then I see holiday weather page
    And I see city name on weather page
    And I see names of next 5 days on weather page
    And I see min and max weather of next 5 days

