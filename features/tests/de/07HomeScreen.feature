@android_test @ios_test @home_screen
Feature: Verify product pages by navigating through biscuits
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly


  Scenario: navigate to booking summary page
    Given I have switched to typical booking
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page


  Scenario: Navigate to hotel booking from home page biscuit
    Given I have switched to typical booking
    When I navigate to hotel 1 from home page
    Then I see hotel 1 page
    And I verify below details on hotel page:
      | Hotel Name      |
      | Hotel location  |
      | Contact buttons |


  Scenario: Navigate to destination country from home page biscuit
    Given I have switched to typical booking
    When I navigate to destination using home page biscuit
    Then I see destination information page

  Scenario: Verify weather screen for Single Booking
    Given I have switched to single booking
    Given I navigate to weather page using weather biscuit
    Then I see holiday weather page