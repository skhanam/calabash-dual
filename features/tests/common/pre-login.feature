@common-tests
Feature: English Sanity Tests

  @prelogin11
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify input elements on login page
#    And I verify button elements on login page


