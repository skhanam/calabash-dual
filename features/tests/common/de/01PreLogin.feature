@de-prelogin @reg-de @reset
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @forgot-password2 
  Scenario: Forgot password - Populated email field
    Given I am on 'Login' screen
    When I fill valid username in login screen
    And I navigate to forgot password screen
    Then I see my username is already populated

  @plgn2
  Scenario: Reset password  - invalid user name or email
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    And submit an invalid email id in forgot password screen
    Then I see appropriate error message

  @plgn3
  Scenario: Forgot password - Blank email field
    Given I am on 'Login' screen
    When I navigate to forgot password screen
    Then I see my username is empty

  @tab4 
  Scenario: US13474 Failed login - wrong credentials
    Given I submit wrong login credentials
    Then I see appropriate error message
    And I should see the error message tip to side of oops message
    And should observe that values entered are retained

  @wrong-country
  Scenario: US13474 Failed login - wrong country
    Given I am on 'Login' screen
    When I submit credentials with wrong country selected
    Then I see alternative country options for submitted credentials
    And I see new user registration section

  @wrong-country1  
  Scenario: US13474 submit wrong country and change to correct country
    Given I am on 'Login' screen
    When I submit credentials with wrong country selected
    Then I see alternative country options for submitted credentials
    When I select correct country and resubmit details
    Then I am on Home screen

  @home-weather2 
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with multi destination booking
    Then I should see a Weather Biscuit appear
    And  I should see Weather Biscuit display weather for each destination in a loop of 5s

   @prelog1n 
  Scenario: US13474 DE Login: Check Page elements
    Given I am on 'Login' screen
    And I should see Heading - Login
    And I should see Username / Password / Country - Pre populated with text
    And I should see Username / Password / Country - with 'i' button
    And I should see Login button
    And I should see Forgot CTA
    And I should see Register CTA
    And I should see I need help CTA

   @prelog1n2 
  Scenario: US14332 Verify Page elements
    Given I accessed the Register page modal
    And I should sub-title and sub title for register page
    And I should see input fields for booking details
    And I should see input fields for account details
    Then I see below items on Register page
      | Register button            |
      | Newsletter opt-in            |
      | E-Mail newsletter disclaimer |
      | Tick box                     |

#  @terms121
#  Scenario: Verify Terms and conditions page from login screen
#    Given I navigate to terms page from login screen
#    Then I see terms page is displayed correctly
#
