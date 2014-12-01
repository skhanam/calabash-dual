@prelogin-de @reset @reg-de
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @plgn4
  Scenario: US13474 Failed login - wrong credentials
    Given I submit wrong login credentials
    Then I see appropriate error message
    And I should see the error message tip to side of oops message
    And should observe that values entered are retained

  Scenario: Forgot password - Populated email field
    Given I am on 'Login' screen
    When I fill valid username in login screen
    And I navigate to forgot password screen
    Then I see my username is already populated

  @plgn3
  Scenario: Forgot password - Blank email field
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    Then I see my username is empty

