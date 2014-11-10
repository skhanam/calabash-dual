@android_test @ios_test @home_screen  @de @auto312 @tab  @tab-home @reg
Feature: Verify product pages by navigating through biscuits
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  @dest1
  Scenario: Navigate to destination country from home page biscuit
    Given I am on home screen with default booking
    When I navigate to first destination using home page biscuit
    Then I see first destination information page

  @hm3  @device
  Scenario: US16743 Destination biscuit verify
    Given I have a pre-holiday booking
    And I swipe to the right of the screen
    Then I should see a destination image biscuit appear
    And I should see a  destination text label name

  @hm8  @device
  Scenario: US16743 Destination biscuit verify
    Given I have a pre-holiday booking
    When I tap on the first destination Biscuit
    Then I see first destination information page

  @hm7 @device
  Scenario: Hotel Biscuit verification
    Given I have a pre-holiday booking
    When I access  the application home page
    Then I should see a Hotel Biscuit appear
    And I should see the text label Step inside hotel name in two lines

#  @hm5  @device
#  Scenario: Currency Converter Biscuit
#    Given I have a pre-holiday booking
#    Then I swipe to see "Currency Biscuit"
#    And I should see a Currency Converter Biscuit appear
#    Then I should see the home currency of 1 = destination currency symbol equal value

#  @hm6  @device
#  Scenario: Converter Biscuit OnTap OK
#    Given I can see the Currency Converter Biscuit
#    When I tap on the Currency Converter Biscuit
#    Then I should be navigated to Currency Converter page

#
#  @failing123
#  Scenario: Navigate to hotel booking from home page biscuit
#    Given I am on home screen with default booking
#    When I navigate to hotel 1 from home page
#    Then I see correct hotel page
#    And I verify below details on hotel page:
#      | Hotel Name      |
#      | Hotel location  |
#      | Contact buttons |

