@android_test-eng @ios_test-eng @auto1 @eng
Feature: English Sanity Tests

  @reset  @wrong-login   
  Scenario: Wrong login
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @reset @login-eng 
  Scenario: Login and Logout
    Given I log into Application
    When I log out from application
    Then I see welcome screen

  @offcanvas-eng  @sanity-eng
  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in eng booking

  @check_list  @sanity-eng
  Scenario: Verify check list item selection
    Given I am check list page
    When I select first item in check list
    Then I see the selected item under completed items
    When I unselect the select item
    Then I see the item at bottom of check list

  @bookings-eng
  Scenario: navigate to booking summary page
    Given I am on Home screen
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page

  @booking-contact_us-eng  @sanity-eng
  Scenario: Verify contact us page and external links present
    Given I am on contact us screen
    Then I verify contact us page

  @weather-eng  @sanity-eng
  Scenario:Week's weather
    Given I am on weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days
    Then I verify facebook and twitter share icons are visible