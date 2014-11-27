#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@common-tests @tab @tab-count @reg @device
Feature: Verify Countdown details for bookings

  @tab-count1 @device
  Scenario: US16736 Countdown Biscuit More than one day
    Given I am on Home screen
    And I have more than one day left for my holiday
    Then I should see a Countdown biscuit with a count of days left

  @tab-count2 @device
  Scenario: US16736 OnTap link
    Given I am on Home screen
    When I select countdown biscuit
    Then I see holiday countdown page

  @tab-count3 @device
  Scenario: US16736 Pre departure
    Given I am on Home screen
    And I have more than one day left for my holiday
    When I access the Holiday Countdown page
    Then I should see Im off to destination in message
    And I should see the number of days left to travel
    And I should see the text Hours, Minutes, Seconds with appropriate values
    And I should see a share icon allowing me to share my countdown