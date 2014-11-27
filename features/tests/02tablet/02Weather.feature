#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@weather @tab @reg
Feature: Verify Weather details for bookings

  #Same
  @home-weather1
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with pre holiday booking
    Then I should see a Weather Biscuit appear
    And I should see Weather type icon
    And I should see country names on weather biscuit

  @home-weather31
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with multi destination booking
    Then I should see a Weather Biscuit appear
    When I navigate to weather page using weather biscuit
    Then I see holiday weather page

