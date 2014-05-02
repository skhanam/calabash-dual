#test cases are present in - https://akqa-lon3.ontestpad.com/script/1035
@ios_test @android_test @auto2
Feature: Verify booking information for Typical Booking

  Scenario: As a TUI client I should be able to access the Hotel page
    Given I have switched to typical booking
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify below details on hotel page:
      | Hotel Name      |
      | Hotel location  |
      | Contact buttons |

  @sanity @failed @verify-hotel-links
  Scenario: As a TUI client with a TUI booking
  I should be able to access the Hotel page
    Given I have switched to typical booking
    When I navigate to hotel 2 page using side menu
    Then I see hotel 2 page
    And I verify below links on hotel page:
      | place         |
      | Food & Drink  |
      | Living        |
      | accommodation |
      | sport         |
      | Wellness      |
      | For Children  |

  Scenario:  Social Share link on hotel page
    Given I have switched to typical booking
    When I navigate to hotel 1 page using side menu
    Then I see hotel 1 page
    And I verify facebook and twitter share icons are visible

  Scenario: Call us button on hotel page
    Given I have switched to typical booking
    And I am on my booking Hotel Page
    When I select call us button on hotel page
    Then I should see an overlay box to call or cancel