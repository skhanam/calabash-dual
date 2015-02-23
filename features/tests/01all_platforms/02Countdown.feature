#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
 @count @reg @sanity @and-tab-done
Feature: Verify Countdown details for bookings

  @count1
  Scenario: US16736 Countdown Biscuit More than one day
    Given I am on Home screen
    And I have more than one day left for my holiday
    Then I should see a Countdown biscuit with a count of days left

  @count2
  Scenario: US16736 OnTap link
    Given I am on Home screen
    When I select countdown biscuit
    Then I see holiday countdown page

  @count3
  Scenario: US16736 Pre departure
    Given I am on Home screen
    And I have more than one day left for my holiday
    When I access the Holiday Countdown page
    Then I should see Im off to destination in message
    And I should see the number of days left to travel
    And I should see the text Hours, Minutes, Seconds with appropriate values
    And I should see a share icon allowing me to share my countdown