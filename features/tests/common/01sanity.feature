@auto1 @sanity-all @common-tests
Feature: Login and Home page features
  Login into application

  @reset  @wrong-login @tab-sanity @basic-sanity
  Scenario: Verify error message for wrong login
    Given I submit wrong login details
    Then I see correct error messages on login screen

