Feature: Welcome (Login)

  As a logged out user
  I want to be able to login to the app
  So that i can view my holiday details

    @smoke1
  Scenario Outline: Check welcome message for each user based on booking date
    Given I am on 'Welcome' page
    When I login with into app and check all messages for "<var>" days

  Examples:
    | var                  |
    | 1 to 6 days          |
    | less than 1 day      |
    | in resort            |
    | more than 1 day past |
#    | 43 or more days |
#    | 29 to 42 days   |
#    | 15 to 28 days   |
#    | 7 to 14 days         |

  @smoke
  Scenario Outline: Check welcome message for each user based on booking date
    Given I am on 'Welcome' page
    When I login with into app and check all messages for "<var>" days
  Examples:
    | var                  |
    | 43 or more days      |
    | 29 to 42 days        |
    | 15 to 28 days        |
    | 7 to 14 days         |
    | 1 to 6 days          |
    | less than 1 day      |
    | in resort            |
    | more than 1 day past |
