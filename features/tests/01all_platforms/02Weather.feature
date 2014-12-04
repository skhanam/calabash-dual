@android_test @ios_test @weather @sanity @reg
Feature: Verify weather features

  @home-weather1
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with pre holiday booking
    Then I should see a Weather Biscuit appear
    And I should see Weather type icon
    And I should see country names on weather biscuit

  @home-weather31
  Scenario: US16737 Navigate to weather page from Weather Biscuit
    Given I am on Home screen with multi destination booking
    Then I should see a Weather Biscuit appear
    When I navigate to weather page using weather biscuit
    Then I see holiday weather page

  @home-weather3
  Scenario: US16737 Verify Weather page
    Given I am on weather page
    Then I see holiday weather page
    And I see weather for first city on weather page
    And I see names of next 5 days on weather page
    And I see min and max weather of next 5 days
