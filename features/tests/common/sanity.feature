@android_test @ios_test @auto1 @nor @sanity-all
Feature: Login and Home page features
  Login into application

  @login1 @reset
  Scenario: Login and verify home screen
    Given I log into Application
    Then I must be logged and on Home page

  @sanity @logout @reset @basic-sanity
  Scenario: Logout
    Given I am on Home screen
    When I log out from application
    Then I see welcome screen

  @basic-sanity
  Scenario: Check Navigation menus
    Given I am on default booking
    Given I am on Home screen
    Then I navigate to each item and navigate back to home screen
      | Countdown       |
      | Holiday summary |
      | Weather         |
      | Flight          |
      | Hotel           |
      | Contact us      |

#      | Destination     |
#      | Duty Free       |
#      | Guide Online    |
#      | App Feedback    |
#      | Log out         |
