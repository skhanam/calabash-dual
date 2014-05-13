@ios_test @android_test @auto3 @tour-guide
Feature: Verify my travel agent

  @travel_agent
  Scenario: navigate to my travel agent page
    Given I have switched to single booking
    Given I am on Home screen
    When I navigate to my travel agent page
    Then I see my travel agent page


