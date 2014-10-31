@common-tests @tab @reg
Feature: English Sanity Tests

  @prelogin11 @reset @testnow
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify input elements on login page
    And I verify button elements on login page

  @reset  @wrong-login33
  @basic-sanity
  Scenario: Verify error message for wrong login
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @register1 @prelogin12
  Scenario: I want to see new user registration page
    Given I am on 'Login' screen
    When I select register option from welcome screen
    Then I see new user registration page
