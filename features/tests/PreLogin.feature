@android_test @ios_test
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @test11
  Scenario: Tell us about yourself
    Given I am on 'Welcome' screen
    Then I see welcome page
    When I choose am already a customer
    And I have already registered tui
    Then I see login screen



  Scenario: Tell us about yourself
    Given I am on 'Welcome' screen
    Then I see welcome page
    When I choose am already a customer
    And I have already registered tui
    Then I see login screen





