#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035
@ios_test @android_test
Feature: Verify flight page details


  @single-journey
  Scenario: Check flights list is not shown for one way journey
    Given I am on home screen with one way booking
    And I navigate to flights page from side panel
    Then I should not see flights list

  @single-journey-flights
  Scenario: Check flights list is not show for one way journey
    Given I am on home screen with one way booking
    And I navigate to flights page from side panel
    Then I should see list of all the flights in my journey


