@android_test @ios_test  @reset @auto1
Feature: Login and Home page features
  Login into application

  @login1
  Scenario: Login and verify home screen
    Given I log into Application
    Then I must be logged and on Home page

  @sanity
  Scenario: Logout
    Given I am on my account page
    When I log out from application
    Then I see welcome screen