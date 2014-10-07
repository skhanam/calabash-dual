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

  @prelogin4 @eng @lg3
  Scenario: US13575 Failed login - wrong credentials
    Given I am on 'Login' screen
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @prelogin4 @eng @lg4
  Scenario: US13575 First Choice customers attempting login into MyThomson
    Given I am a First Choice customers attempting to log into MyThomson
    When I submit First Choice login credentials
    #Then I see correct error messages on login screen