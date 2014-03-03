#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035

@ios_test @android_test  @auto2
Feature: Verify booking information for Typical Booking

  Background:
    Given I have switched to typical booking

  Scenario: Verify welcome screen
    Then I verify appropriate welcome message for booking


  Scenario: Verify countdown screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page
    And I verify number of days left to travel
    And I verify facebook and twitter share icons are visible

  @sanity
  Scenario: Left off canvas Menu listing
    Given I have opened side menu
    Then I should see a list of products in my booking

  Scenario: Check Flights - 1st Level
    Given I navigate to flights page from side panel
    Then I should see one or more flights listed vertically
    And I should see the origin to destination place name
    And I should see the departure date
    And I should see the list of passengers on each flight leg
