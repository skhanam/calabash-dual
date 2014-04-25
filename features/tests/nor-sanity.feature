@nor  @eng @sanity-eng
Feature: English Sanity Tests

  @reset  @wrong-login-nor
  Scenario: Verify error message for wrong login
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
    Then I should see a list of products in booking

  @booking-nor1
  Scenario: navigate to booking summary page
    Given I am on Home screen
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page

  @booking-nor2
  Scenario: navigate to booking summary page
    Given I am on Home screen
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page

  @contact_us-nor
  Scenario: Verify contact us page and external links present
    Given I am on contact us screen
    Then I verify contact us page

  @weather-nor
  Scenario:Week's weather
    Given I am on weather page
    Then I see holiday weather page
    And I should weather forecast for five sequential days

  @countdown2
  Scenario:Check holiday countdown using biscuit
    Given I am on Home screen
    Then I navigate to countdown page using countdown biscuit
    Then I verify number of days left to travel

  @countdown3
  Scenario:Check holiday countdown using biscuit
    Given I am on Home screen
    Then I verify number of days to go on home page

