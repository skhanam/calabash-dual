@prelogin-en  @reset @reg-en
Feature: Verify pre login screen

  @lg1
  Scenario:
    Given I am on 'Welcome' screen
    When I tap on the top half of welcome page
    Then I am on 'Login' screen

  @lg11
  Scenario:
    Given I am on 'Login' screen
    When I tap the back arrow on login screen
    Then I am on 'Welcome' screen

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