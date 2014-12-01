@prelogin-en  @reset @reg-tab-en
Feature: Verify pre login screen

  @lg1 @done
  Scenario: Check Page elements
    Given I am on 'Login' screen
    Then I see login Page

  @lg2   @done
  Scenario: US18521 Tap Retrieve booking
    Given I am on 'Login' screen
    When  I tap 'Retrieve my booking' button
    Then I see retrieve my booking page
    Then I verify retrieve my booking page

  @lg3
  Scenario: US13575 Failed login - wrong credentials
    Given I am on 'Login' screen
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @lg5
  Scenario: US18521 Successful retrieval
    Given I have entered correct email address
    When I the Tap 'submit' button retrieve booking page
    Then I see success messages on booking ref page

  @lg6
  Scenario: US18521 Failed retrieval
    Given I have entered wrong email address
    When I the Tap 'submit' button retrieve booking page
    Then I see error messages on booking ref page

