@android_test @ios_test
Feature: Verify Excursions page

  Scenario: Check Excursion screen
    Given I am on home screen with default booking
    When I navigate to excursion page from side panel
    Then I verify excursions page


  Scenario: Verify links on Excursion screen
    Given I am on home screen with default booking
    When I navigate to excursion page from side panel
    Then I verify excursions page
    When I select link for excursion
    Then I see webview with excursions listed