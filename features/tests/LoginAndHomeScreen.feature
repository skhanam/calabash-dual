@android_test @ios_test
Feature: Login and Home page features
  Login into application
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  @reset
  Scenario Outline: Check log in
    Given I log into Application using "<username>" and "<password>"
    Then I must be on Home page
  Examples:
    | username  | password |
    | reisender | meinetui |


  Scenario: Logout from my account page
    Given I am on my account page
    When I log out from application
    Then I see welcome screen

  Scenario: Open countdown page from side panel and check its displayed correctly
    Given I am on Home screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page and navigate back to home screen

  Scenario: Open countdown page from countdown biscuit and check its displayed correctly
    Given I am on Home screen
    When I navigate to countdown page using countdown biscuit
    Then I see holiday countdown page and navigate back to home screen

  Scenario: Open weather page from side panel and check its displayed correctly
    Given I am on Home screen
    When I navigate to weather page using side menu
    Then I see holiday weather page and navigate back to home screen

  Scenario:Open weather page from weather biscuit and check its displayed correctly
    Given I am on Home screen
    When I navigate to weather page using weather biscuit
    Then I see holiday weather page and navigate back to home screen

  Scenario: Open booking summary page from side panel and check its displayed correctly
    Given I am on Home screen
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page and navigate back to home screen

  Scenario: Open booking summary page from booking summary biscuit and check its displayed correctly
    Given I am on Home screen
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page and navigate back to home screen