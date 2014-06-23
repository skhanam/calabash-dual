#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035
@ios_test @android_test @common-tests
Feature: Verify flight page details

  @flights1
  Scenario:Check names of flights on flights page
    Given I am on home screen with default booking
    And I navigate to flights page from side panel
    Then I see flights page with my flights listed

  @flights2 @ss
  Scenario:Check booking details of each flight
    Given I am on home screen with default booking
    And I navigate to flights page from side panel
    Then I verify details of all flights

  @single-journey
  Scenario: Check flights list is not shown for one way journey
    Given I am on home screen with default booking
    And I navigate to flights page from side panel
    Then I should not see flights list

  @single-journey-flights
  Scenario: Check flights list is not show for one way journey
    Given I am on home screen with default booking
    And I navigate to flights page from side panel
    Then I should see list of all the flights in my journey


