@prelogin-de @reg-tab-de @reset
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

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
