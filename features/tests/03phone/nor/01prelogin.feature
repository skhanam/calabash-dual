@android_test @ios_test @prelogin @nor-ph @reset
Feature: Verify pre login screen

 @prelogin3
  Scenario: Verify book visit in welcome screen
    Given I am on 'Login' screen
    When I select book visit page
    Then I verify book visit page

 @nor-lg1 @done
  Scenario: Check Page elements
    Given I am on 'Login' screen
    Then I see login Page

  @nor-lg3
  Scenario: US13575 Failed login - wrong credentials
    Given I am on 'Login' screen
    Given I submit wrong login details
    Then I see correct error messages on login screen