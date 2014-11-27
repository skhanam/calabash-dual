#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@flight-biscuits @tab @reg
Feature: US16741 Flights Biscuit


  @flight-biscuits1
  Scenario: US16741 Flights Biscuit pre-departure flight
    Given I am on Home screen with pre holiday booking
    Then I swipe to see "flights Biscuit"
    Then I should flight information on flight biscuit
