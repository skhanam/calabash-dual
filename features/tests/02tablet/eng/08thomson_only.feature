@reset
Feature: Verify post Holiday Biscuit

  @thomson-only @and-tab-done
  Scenario: US13575 First Choice customers attempting login into MyThomson
    Given I am a First Choice customers attempting to log into MyThomson
    When I submit First Choice login credentials
    Then I see error messages when first choice user logs into myThomson
