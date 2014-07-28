@common-tests
Feature: English Sanity Tests

  @prelogin11
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify input elements on login page
    And I verify button elements on login page

  @prelogin112
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    When I select tooltip icon for each input field
    Then I see correct tool tip message


