@reset @reg-tab-en
Feature: Verify pre login screen

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