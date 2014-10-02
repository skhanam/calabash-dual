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

  @hm3
  Scenario: Destination biscuit verify
    Given I have a pre-holiday booking
    And I swipe to the right of the screen
    Then I should see a destination image biscuit appear
    And I should see a  destination text label name

  @hm4
  Scenario: OnTap link of destination biscuit
    Given I am on home screen with default booking
    When I tap on the destination Biscuit
    Then I should be navigated to destination page

  @hm5
  Scenario: Currency Converter Biscuit
    Given I have a pre-holiday booking
    Then I swipe to see "Currency Biscuit"
    And I should see a Currency Converter Biscuit appear
    Then I should see the home currency of 1 = destination currency symbol equal value

  @hm6
  Scenario: Converter Biscuit OnTap OK
    Given I can see the Currency Converter Biscuit
    When I tap on the Currency Converter Biscuit
    Then I should be navigated to Currency Converter page

  Scenario: OnTap Excursions
    Given I can see the Excursions Biscuit
    Then I should be navigated to Excursions Mosaic page

  @hm7
  Scenario: Hotel Biscuit verification
    Given I have a pre-holiday booking
    When I access  the application home page
    Then I should see a Hotel Biscuit appear
    And I should see the text label Step inside hotel name in two lines

  @hm8
  Scenario: Holiday extras Biscuit
    Given I have a pre-holiday booking
    When I access  the application home page
    Then I swipe to see "extras Biscuit"
    Then I should see an Holiday extras Biscuit appear


