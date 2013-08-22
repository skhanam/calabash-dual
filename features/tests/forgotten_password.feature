Feature: Forgotten Password

  As a logged out User
  I want to reset my password
  So I can re-gain access to the site content

  @dev
  Scenario: Forgot password - Populated email field

    Given I am on the welcome(login) screen
    When I enter in my username/email in it's field
    And I tap the login button
    Then I should be taken to the 'Forgot password' screen.
    And I should see the text from the welcome screen pre-populated on the Forgot password screen
    And the reset password button should be enabled

  Scenario: Forgot password - Blank email field

    Given I am on the welcome(login) screen
    And I leave the username/email field blank
    When I tap the login button
    Then I should be taken to the 'Forgot password' screen.
    And I should see a blank username field on the Forgot password screen
    And the reset password button should be disabled until I start typing in it

  Scenario: Reset password - invalid user name or email

    Given I am on the Forgot password screen
    And I enter in an invalid username/email
    When I click on the reset my password button
    Then I should see the following error appear: "Sorry, we didn't recognise those log in details. Please try again or register"

  Scenario: Reset password - valid user name or email

    Given I am on the Forgot password screen
    And I enter in a valid username/email
    When I click on the reset my password button
    Then I should see the welcome(login) screen appear
    And I should see the following message appear: "Please check your email to retrieve your password"