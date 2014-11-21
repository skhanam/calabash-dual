@common-tests  @tab @reg @tab-sanity
Feature: Login and Home page features
  Login into application

  @reset
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

  Scenario: Logout from Side menu
    Given I am on Home screen with pre holiday booking
    When I click on Logout using side menu
    When I confirm Logout
    Then I should navigate to welcome screen
