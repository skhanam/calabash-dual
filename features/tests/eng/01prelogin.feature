@prelogin  @reset
Feature: Verify pre login screen

  @prelogin4 @eng
  Scenario: Verify book visit in welcome screen
    Given I am booking reference page
    Then I verify retrieve my booking page

  @prelogin5
  Scenario: Verify book visit in welcome screen
    Given I am booking reference page
    When I submit wrong booking details in booking ref page
    Then I see error messages on booking ref page