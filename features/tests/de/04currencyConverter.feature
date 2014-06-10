@ios_test @android_test  @de
Feature: Currency converter
  As a TUI client with a TUI booking
  I should be able to access the currency converter page
  So I can find out the locale conversion rate

  Scenario: Check currency conversion
    Given I have switched to non eu booking
    And I navigate to currency converter page from home screen
    Then I default currency values pre-filled in the screen

  Scenario: Check currency swap
    Given I have switched to non eu booking
    And I navigate to currency converter page from home screen
    When I select on the currency swap icon
    Then I see currency pairs should swap places
