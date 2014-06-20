@nor @eng
Feature: English Sanity Tests

  @offcanvas @failed
  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in booking

  @bookingsummary_biscuit
  Scenario: Booking summary biscuit on home page
    Given I am on home screen with default booking
    When I select booking summary biscuit on home page
    Then I see holiday booking summary page

  @guide_online_biscuit @ss
  Scenario: Check guide online biscuit
    Given I am on home screen with default booking
    When I select guide online biscuit on home page
    Then I see guide online page