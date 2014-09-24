@auto1 @sanity-all @common-tests   @tab
Feature: Login and Home page features
  Login into application

  @reset  @wrong-login33  @basic-sanity
  Scenario: Verify error message for wrong login
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @reset @successful-login312 @tab-sanity
  Scenario:  Successful login
    Given I am on 'Login' screen
    When I submit correct login credentials
    Then I must be logged in and on Home page
