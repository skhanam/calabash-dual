@android_test @ios_test @common-tests @tab
Feature: Verify product pages by navigating through side panel
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  @countdown32 @countdown32
  Scenario: navigate to countdown page
    Given I am on Home screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page

#TODO  Given I am on home screen with default booking must be used throughout this file
  @countdown321
  Scenario: navigate to weather page
    Given I am on Home screen
    When I navigate to weather page using side menu
    Then I see holiday weather page

  @booking-summary321
  Scenario: navigate to booking summary page
    Given I am on Home screen
    And I navigate to booking summary page using side menu
    Then I see holiday booking summary page

   @dest12 @ss @failed
  Scenario: Navigate to destination guide page and verify list of destinations
    Given I am on Home screen
    And I navigate to destination using side menu
    Then I see list of destinations on destination info page

  @dest21 @failed
  Scenario: Navigate to destination guide page and verify each destination page
    Given I am on Home screen
    And I navigate to destination using side menu
    Then I check destination page for each destination

  @contact_us12
  Scenario: Verify contact us page and external links present
    Given I am on contact us screen
    Then I verify contact us page