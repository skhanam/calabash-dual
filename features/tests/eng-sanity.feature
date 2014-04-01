@android_test @ios_test   @auto1 @sanity-eng
Feature: English Sanity Tests

  @reset
  Scenario: Logout
    Given I log into Application
    When I log out from application
    Then I see welcome screen

  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in eng booking

  @failedhere
  Scenario: Verify check list item selection
    Given I am check list page
    When I select first item in check list
    Then I see the selected item under completed items
    When I unselect the select item
    Then I see the item at bottom of check list
