@ios_test @android_test @reset @auto1  @de
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @phone
  Scenario: Verify first welcome screen
    Given I am on welcome page
    Then I should see two options:
      | Im registered with TUI |
      | Im not registered      |

  @new_to_tui @phone
  Scenario: Verify new to TUI page
    Given I am on welcome page
    When I choose haven't booked through TUI
    Then I should see the Sales screen

  @failing
  Scenario: Already customer and I haven't logged in yet
    Given I am on welcome page
    When I select 'I havent logged in before'
    Then I see new user registration page

  @failing1
  Scenario: Already customer and I have logged in before
    Given I am on welcome page
    When I select 'I have logged in before'
    Then I see login Page

  Scenario: Login with Non Matching Records  - invalid email
    Given I have entered an invalid email and a valid password
    When I select the Login button
    Then I see appropriate username error message

  @terms123
  Scenario: Verify Terms and conditions page from login screen
    Given I navigate to terms page from login screen
    Then I see terms page is displayed correctly