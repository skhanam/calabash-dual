@android_test @ios_test @test
Feature: Login and Home page features
  Login into application

  @reset
  Scenario: Login and verify home screen
    Given I log into Application
    Then I must be on Home page

  Scenario: Logout from my account page
    Given I am on my account page
    When I log out from application
    Then I see welcome screen