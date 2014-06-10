#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035
@ios_test @android_test  @countdown @common-tests
Feature: Verify Countdown details for bookings

  @countdown2
  Scenario: navigate to countdown page
    Given I am on home screen with default booking
    When I navigate to countdown page using countdown biscuit
    Then I see holiday countdown page
    And I verify number of days left to travel

  @countdown4 @common-tests
  Scenario:Check holiday countdown using biscuit
    Given I am on home screen with default booking
    Then I verify number of days to go on home page
