@android_test @ios_test @prelogin @nor @reset
Feature: Verify pre login screen

 @prelogin3
  Scenario: Verify book visit in welcome screen
    Given I am on 'Login' screen
    When I select book visit page
    Then I verify book visit page