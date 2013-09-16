Feature: Welcome (Login)

  As a logged out user
  I want to be able to login to the app
  So that i can view my holiday details

# @smoke
  Scenario: Login with Non Matching Records - invalid user name or email

    Given I am in the Welcome Page
    When I login with invalid credentials
    Then the following message should appear "Ihre Anmeldung war leider nicht erfolgreich."

#  Scenario: Login with Non Matching Records - invalid password
#
#    Given I have entered a valid user name or email and an invalid password
#    When I select the Login button
#    Then the following message appears "Sorry, your email/user-name or password don't match our records, Please check and try again'
#
#  Scenario: Login when system has a problem
#
#    Given I have entered a valid username or email and password
#    And the system service has an issue affecting login
#    When I select the Login button
#    Then I should see the following message appears "Sorry, there was a problem logging you in. Please try again or email us for help."
#
#  Scenario: Login with account Not activated
#
#    Given I have entered an inactive username or email
#    When I select the Login button
#    Then I should see the following error appear: "This user account is not activated yet. Please check your inbox for an activation email"
#
#  Scenario: Account locked
#
#    Given I have entered a lock username or email
#    When I select the Login button
#    Then I should see the following error appear "Sorry, this user account is locked. Please email us to resolve this issue"
#
#  Scenario: Successful login
#
#    Given I have entered a valid username or email and post code
#    When I select Login button
#    Then the message " Hold on we're just finding your holiday..." should appear And... the Home screen loads
#
#  Scenario: Email Help
#
#    Given I am logged out user And... I am on the Welcome(login) screen
#    When I tap on 'Email help'
#    Then I should my native email client appear
#    And the email 'To' field should be populated with customer service email