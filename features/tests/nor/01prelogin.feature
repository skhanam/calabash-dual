@android_test @ios_test @prelogin @nor @reset
Feature: Verify pre login screen

  @prelogin1 @ss
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify text content on login screen

  @prelogin2
  Scenario: Verify help logging link on welcome screen
    Given I am on 'Login' screen
    When I select help logging in page
    Then I verify help logging in page

  @prelogin3
  Scenario: Verify book visit in welcome screen
    Given I am on 'Login' screen
    When I select book visit page
    Then I verify book visit page