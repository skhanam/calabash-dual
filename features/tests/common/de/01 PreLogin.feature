@reset @auto1 @de @tab-sanity @1prelogin
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @forgot-password2
  Scenario: Forgot password - Populated email field
    Given I am on 'Login' screen
    When I fill valid username in login screen
    And I navigate to forgot password screen
    Then I see my username is already populated

  @sanity @tab2
  Scenario: Reset password  - invalid user name or email
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    And submit an invalid email id in forgot password screen
    Then I see appropriate error message

  @tab3
  Scenario: Forgot password - Blank email field
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    Then I see my username is empty

  @tab4
  Scenario: US13474 Failed login - wrong credentials
    Given I submit wrong login credentials
    Then I see appropriate error message
    And I should see the error message tip to side of oops message
    And should observe that values entered are retained

  @terms12
  Scenario: Verify Terms and conditions page from login screen
    Given I navigate to terms page from login screen
    Then I see terms page is displayed correctly

  @wrong-login11 @reset
  Scenario: US13474 Failed login - wrong country
    Given I am on 'Login' screen
    When I submit credentials with wrong country selected
    Then I see alternative country options for submitted credentials
    And I see new user registration section

  @wrong-login12 @reset
  Scenario: US13474 Failed login - wrong country
    Given I am on 'Login' screen
    When I submit credentials with wrong country selected
    Then I see alternative country options for submitted credentials
    When I select correct country and resubmit details
    Then I am on Home screen

