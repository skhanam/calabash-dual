#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@ios_test @android_test  @countdown32 @common-tests
Feature: Verify Countdown details for bookings

  @countdown2232
  Scenario: Verify days left to travel on countdown page
    Given I am on home screen with default booking
    When I navigate to countdown page using countdown biscuit
    Then I see holiday countdown page
    And I verify number of days left to travel

  @countdown4232 @common-tests
  Scenario:Verify days left to travel on home page biscuit
    Given I am on home screen with default booking
    Then I verify number of days to go on home page
