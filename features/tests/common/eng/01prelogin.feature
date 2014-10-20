@prelogin  @reset  @device-en
Feature: Verify pre login screen

  @prelogin4  @eng @lg1
  Scenario: US16882 US13575 Tap Retrieve booking
    Given I am on 'Login' screen
    When  I tap 'Retrieve my booking' button
    Then I see retrieve my booking page
    Then I verify retrieve my booking page

  @prelogin4 @eng @lg2
  Scenario: US13575 Tap I cant login Help
    Given I am on 'Login' screen
    When  I tap 'I can't login in' button
    Then I verify help logging in page

  @prelogin4 @eng @lg7
  Scenario: US16884 Check Page elements in I cant login Help page
    Given I am on 'Login' screen
    When  I tap 'I can't login in' button
    Then I should be navigated to Help logging in modal page
    Then I should see 'Help logging in' and other page elements

  @prelogin4 @eng @lg3
  Scenario: US13575 Failed login - wrong credentials
    Given I am on 'Login' screen
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @prelogin4 @eng @lg4
  Scenario: US13575 First Choice customers attempting login into MyThomson
    Given I am a First Choice customers attempting to log into MyThomson
    When I submit First Choice login credentials
    Then I see error messages when first choice user logs into myThomson

  @prelogin4 @eng @lg5
  Scenario: US16882 Successful retrieval
    Given I have entered correct email address
    When I the Tap 'submit' button
    Then I see success messages on booking ref page

  @prelogin4 @eng @lg6
  Scenario: US16882 Failed retrieval
    Given I have entered wrong email address
    When I the Tap 'submit' button
    Then I see error messages on booking ref page


