@ios_test @android_test @reset @auto1   @failed
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @fail1
  Scenario: Verify first welcome screen
    Given I am on welcome page
    Then I should see two options:
      | Im registered with TUI |
      | Im not registered      |

  @failed
  Scenario: Verify new to TUI page
    Given I am on welcome page
    When I choose haven't booked through TUI
    Then I should see the Sales screen

  @sanity
  Scenario: Reset password  - invalid user name or email
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    And submit an invalid email id in forgot password screen
    Then I see appropriate error message

  Scenario: Login with Non Matching Records  - invalid password
    Given I have entered an valid email and invalid password
    When I select the Login button
    Then I see appropriate password error message

  @forgot-password
  Scenario: Forgot password - Populated email field
    Given I am on 'Login' screen
    When I fill valid username in login screen
    And I navigate to forgot password screen
    Then I see my username is already populated

  Scenario: Forgot password - Blank email field
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    Then I see my username is empty

  @sanity
  Scenario: Already customer and I haven't logged in yet
    Given I am on welcome page
    When I select 'I havent logged in before'
    Then I see new user registration page

  @failed
  Scenario: Already customer and I have logged in before
    Given I am on welcome page
    When I select 'I have logged in before'
    Then I see login Page

  Scenario: Login with Non Matching Records  - invalid email
    Given I have entered an invalid email and a valid password
    When I select the Login button
    Then I see appropriate username error message

  Scenario: Verify Terms and conditions page from login screen
    Given I navigate to terms page from login screen
    Then I see terms page is displayed correctly