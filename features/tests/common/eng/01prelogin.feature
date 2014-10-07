@prelogin  @reset
Feature: Verify pre login screen

  @prelogin4 @eng @lg1
  Scenario: Scenario: Tap Retrieve booking
    Given I am on 'Login' screen
    When  I tap 'Retrieve my booking' button
    Then I see retrieve my booking page

  @prelogin4 @eng @lg2
  Scenario: Tap I cant logging Help
    Given I am on 'Login' screen
    When  I tap 'I can't login in' button
    Then I verify help logging in page


