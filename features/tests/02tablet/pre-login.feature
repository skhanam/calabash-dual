@reg-tab @and-tab-done
Feature: Prelogin tests

  @reset  @wrong-login33
  Scenario: Verify error message for wrong login
    Given I submit wrong login details
    Then I see correct error messages on login screen

