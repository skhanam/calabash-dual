@android_test @ios_test
Feature: Verify product pages by navigating through side panel
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  Scenario: navigate to countdown page
    Given I am on home screen with default booking
    When I navigate to countdown page using side menu
    Then I see holiday countdown page

  Scenario: navigate to weather page
    Given I am on home screen with single booking
    When I navigate to weather page using side menu
    Then I see holiday weather page

  @booking-summary
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    And I navigate to booking summary page using side menu
    Then I see holiday booking summary page

  @ss
  Scenario: Navigate to destination guide page and verify list of destinations
    Given I am on home screen with default booking
    And I navigate to destination using side menu
    Then I see list of destinations on phone destination info page

  @dest2
  Scenario: Navigate to destination guide page and verify each destination page
    Given I am on home screen with default booking
    And I navigate to destination using side menu
    Then I check destination page for each destination

  @contact_us1
  Scenario: Verify contact us page and external links present
    Given I am on contact us screen
    Then I verify contact us page