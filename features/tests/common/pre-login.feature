@common-tests @tab
Feature: English Sanity Tests

  @prelogin11 @reset
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify input elements on login page
    And I verify button elements on login page

  @register1 @prelogin12
  Scenario: I want to see new user registration page
    Given I am on 'Login' screen
    When I select register option from welcome screen
    Then I see new user registration page

  @prelogin112
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    When I select tooltip icon for each input field
    Then I see correct tool tip message
