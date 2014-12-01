@android_test @ios_test @reg-tab
Feature: Verify product pages by navigating through side panel
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  @countdown32222
  Scenario: navigate to countdown page
    Given I am on Home screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page

  @weather32222
  Scenario: navigate to weather page
    Given I am on Home screen
    When I navigate to weather page using side menu
    Then I see holiday weather page

  @booking-summary321 @bs1
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    And I navigate to booking summary page using side menu
    Then I see tablet holiday booking summary page

  @contact11
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    And I navigate to contact us page using side menu
    Then I see tablet contact us page

  @fb1
  Scenario: navigate to App feedback
    Given I am on home screen with default booking
    And I navigate to feedback page using side menu
    Then I see app feedback page

  @ImpInfo1
  Scenario: navigate to App feedback
    Given I am on Home screen
    And I navigate to important information page using side menu
    Then I see important information feedback page