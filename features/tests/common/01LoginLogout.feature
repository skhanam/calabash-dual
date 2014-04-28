@android_test @ios_test  @reset @auto1 @nor
Feature: Login and Home page features
  Login into application

  @login1
  Scenario: Login and verify home screen
    Given I log into Application
    Then I must be logged and on Home page

  @sanity @logout
  Scenario: Logout
    Given I log into Application
    When I log out from application
    Then I see welcome screen
