@ios_test @android_test
Feature: Verify booking information for Typical Booking

  Background:
    Given I have switched to typical booking

  Scenario: Verify welcome screen
    Then I verify appropriate welcome message for booking

  Scenario: Verify countdown screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page
    And I verify number of days left to travel
    And I verify facebook and twitter share icons

  @testing  @testing
  Scenario: As a TUI client with a TUI booking
  I should be able to access the Hotel page
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify below details on hotel page:
      | hotel location |


  Scenario:  Social Share link on hotel page
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify facebook and twitter share icons

  Scenario: Call us button on hotel page
    Given I am on my booking Hotel Page
    When I select call us button on hotel page
    Then I should see an overlay box to call or cancel

  Scenario:
    Given I am on my booking Hotel Page
    When I view the Customer satisfaction section
    Then I should see the customer satisfaction ratings on a scale of 0 - 100% for
      | Hotel overall  |
      | Service        |
      | Equipment      |
      | Food and drink |






