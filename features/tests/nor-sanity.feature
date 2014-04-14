@nor
Feature: English Sanity Tests

  @reset  @wrong-login-nor
  Scenario: Login and Logout
    Given I submit wrong login details
    Then I see correct error messages on login screen

  @reset @nor-login
  Scenario: Login and Logout
    Given I log into Application
    When I log out from application
    Then I see welcome screen

  @offcanvas-nor
  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in nor booking

  Scenario: navigate to booking summary page
    Given I am on Home screen
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page

  @booking-contact_us-nor
  Scenario: Verify contact us page and external links present
    Given I am on contact us screen
    Then I verify contact us page

  @weather-nor
  Scenario:Week's weather
    Given I am on weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days