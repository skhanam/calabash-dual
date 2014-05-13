#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035
@ios_test @android_test @common-tests
Feature: Verify flight page details

  @flights
  Scenario:Get flight booking details
    Given I have home screen with default booking
    Given I navigate to flights page from side panel
    Then I see flights page with my flights listed

