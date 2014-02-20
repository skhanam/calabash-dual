@android_test @ios_test
Feature: Verify product pages by navigating through biscuits
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  Background:
    Given I am on Home screen

  Scenario: navigate to countdown page
    When I navigate to countdown page using countdown biscuit
    Then I see holiday countdown page


  Scenario: navigate to booking summary page
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page