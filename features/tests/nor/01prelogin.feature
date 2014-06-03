@android_test @ios_test
Feature: Verify pre login screen

  @prelogin1
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify text content on login screen

  @prelogin2
  Scenario: Verify links present on welcome screen
    Given I am on 'Login' screen
    When I select help logging in page
    Then I verify help logging in page

  Scenario: Verify links present on welcome screen
    Given I am on 'Login' screen
    When I select book visit page
    Then I verify book visit page