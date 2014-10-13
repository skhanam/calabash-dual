#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@weather @common-tests @flight-biscuits @tab @reg
Feature: US16741 Flights Biscui


  @flight-biscuits1
  Scenario: US16741 Flights Biscuit pre-departure flight
    Given I am on Home screen with pre holiday booking
    Then I swipe to see "flights Biscuit"
    Then I should see the nearest upcoming flights
#
#    And I should see departure airport abbreviation and destination airport abbreviation
#    And I should see airport nicknames below airport abbreviations
#    And I should see the information "Departing on <departure date>"

  Scenario: US16741 Flights Biscui OnTap link
    Given I am on the application homepage
    When I tap on the Flights Biscuit
    Then I should be navigated to T2.0 Holiday Summary page
    And I should see currently displayed flight highlighted