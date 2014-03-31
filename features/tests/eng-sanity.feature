@android_test @ios_test   @auto1 @sanity-eng
Feature: English Sanity Tests

  @reset
  Scenario: Logout
    Given I log into Application
    When I log out from application
    Then I see welcome screen

  @fail3212
  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in eng booking
