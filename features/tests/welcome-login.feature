Feature: Welcome (Login)

  As a logged out user
  I want to be able to login to the app
  So that i can view my holiday details

  @smoke1
  Scenario Outline: Login with Non Matching Records - invalid user name or email

    Given I am on 'Welcome' page
    When I login with into app and check all messages for "<var>" days
  Examples:
    | var         |
    | more than 1 day past |

#    Then I must see appropriate welcome text
#  @smoke
#  Scenario: Login with Non Matching Records - invalid user name or email
#
#    Given I am on 'Welcome' page
#    When I click "Im ready to log in"
#    When I login with invalid credentials
#    Then the following message should appear "Ihre Anmeldung war leider nicht erfolgreich."
#
#
#   @smoke
#  Scenario: Login with Matching Records - valid user name or email
#
#    Given I am on 'Welcome' page
#    When I login with valid credentials
#    Then I should see 'Your Bookings' page
#     And  I click 'Logout' in Menu Bar
#     And I am back on 'Tell us about yourself' page
