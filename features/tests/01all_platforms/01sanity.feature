@tab @reg @tab-sanity @sanity @ph-sanity
Feature: Login and Home page features
  Login into application

  @reset @san1
  Scenario: US13575 Successful login
    Given I am on 'Login' screen
    When I submit correct login credentials
    Then I must be logged in and on Home page

  @san2
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with pre holiday booking
    Then I should see a Weather Biscuit appear
    And I should see Weather type icon
    And I should see country names on weather biscuit

  @san3
  Scenario: Logout from App
    Given I am on Home screen with pre holiday booking
    When I navigate to logout
    And I confirm Logout
    Then I should navigate to welcome screen
