@wrong-country @reset @reg-de
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  @wrong-country1  @notdevice
  Scenario: US13474 Failed login - wrong country
    Given I am on 'Login' screen
    When I submit credentials with wrong country selected
    Then I see alternative country options for submitted credentials
    And I see new user registration section

  @wrong-country2 @notdevice
  Scenario: US13474 submit wrong country and change to correct country
    Given I am on 'Login' screen
    When I submit credentials with wrong country selected
    Then I see alternative country options for submitted credentials
    When I select correct country and resubmit details
    Then I am on Home screen