@common-phone  @excursions
Feature: Verify Excursions page

  @excursions1
  Scenario: Check Excursion screen
    Given I am on home screen with default booking
    When I navigate to excursion page from side panel
    Then I verify excursions page