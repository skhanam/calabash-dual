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
    And I verify facebook and twitter share icons are visible

  Scenario: As a TUI client I should be able to access the Hotel page
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify below details on hotel page:
      | Hotel Name      |
      | Hotel location  |
      | Contact buttons |

  Scenario: As a TUI client with a TUI booking
  I should be able to access the Hotel page
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify below links on hotel page:
      | place         |
      | Food & Drink  |
      | accommodation |
      | Living        |
      | sport         |
      | Entertainment |
      | Wellness      |
      | For Children  |

  Scenario:  Social Share link on hotel page
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify facebook and twitter share icons are visible

  Scenario: Call us button on hotel page
    Given I am on my booking Hotel Page
    When I select call us button on hotel page
    Then I should see an overlay box to call or cancel

  Scenario: Left off canvas Menu listing
    Given I have opened side menu
    Then I should see a list of products in my booking

   @failed
  Scenario: Check Flights - 1st Level
    Given I navigate to flights page from side panel
    Then I should see one or more flights listed vertically
    And I should see the origin to destination place name
    And I should see the departure date
    And I should see the list of passengers on each flight leg
