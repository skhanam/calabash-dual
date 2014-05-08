#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035
@ios_test @android_test  @countdown @common-tests
Feature: Verify Countdown details for bookings

  @countdown2
  Scenario: navigate to countdown page
    Given I have home screen with default booking
    When I navigate to countdown page using countdown biscuit
    Then I see holiday countdown page

  @countdown3 @basic-sanity
  Scenario:Check holiday countdown using biscuit
    Given I am on Home screen
    Given I am on default booking
    Then I navigate to countdown page using side menu
    Then I verify number of days left to travel

  @countdown4
  Scenario:Check holiday countdown using biscuit
    Given I am on Home screen
    Given I am on default booking
    Then I verify number of days to go on home page
