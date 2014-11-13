@prelogin-en  @reset @reg-en
Feature: Verify pre login screen

  @lg1
  Scenario: Check Page elements
    Given I am on 'Login' screen
    Then I see login Page

  @lg2
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

  @lg7
  Scenario: Verify welcome screen
    Given I am on 'Login' screen
    Then I verify input elements on login page
    And I verify button elements on login page

  @lg8
  Scenario: US16884 Tap I cant login Help
    Given I am on 'Login' screen
    When  I tap 'I can't login in' button
    Then I verify help logging in page

  @lg9
  Scenario: US16884 Check Page elements in I cant login Help page
    Given I am on 'Login' screen
    When  I tap 'I can't login in' button
    Then I should be navigated to Help logging in modal page
    Then I should see 'Help logging in' and other page elements

