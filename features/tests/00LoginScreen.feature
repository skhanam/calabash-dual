@ios_test @android_test @test1
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  Background:
    Given I am on 'Login' screen

  @reset   @ios_test1
  Scenario: Forgot password - Populated email field
    When I fill valid username in login screen
    And I navigate to forgot password screen
    Then I see my username is already populated

  @ios_test1
  Scenario: Forgot password - Blank email field
    When I navigate to forgot password screen
    Then I see my username is empty

  Scenario: Reset password  - invalid user name or email
    When I navigate to forgot password screen
    And submit an invalid email id in forgot password screen
    Then I see appropriate error message









