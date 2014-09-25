@android_test @ios_test @home_screen  @de @auto312 @tab
Feature: Verify product pages by navigating through biscuits
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly


#
#    And I navigate to weather page using weather biscuit
#    Then I see holiday weather page


#  Scenario: navigate to booking summary page
#    Given I am on home screen with default booking
#    When I navigate to booking summary page using booking summary biscuit
#    Then I see holiday booking summary page

  Scenario: Navigate to hotel booking from home page biscuit
    Given I am on home screen with default booking
    When I navigate to hotel 1 from home page
    Then I see hotel 1 page
    And I verify below details on hotel page:
      | Hotel Name      |
      | Hotel location  |
      | Contact buttons |

  Scenario: Navigate to destination country from home page biscuit
    Given I am on home screen with default booking
    When I navigate to destination using home page biscuit
    Then I see destination information page

