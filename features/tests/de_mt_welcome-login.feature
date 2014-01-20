Feature: Login and Home page features
  Login into application
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  @reset @smoke1-de-mt @test
  Scenario Outline: Check log in
    Given I log into Application using "<username>" and "<password>"
    Then I must be on Home page
  Examples:
    | username  | password |
    | reisender | meinetui |


  @smoke1-de-mt  @test
  Scenario: Check countdown page is displayed correctly
    Given I am on Home screen
    When I navigate to countdown page using countdown biscuit
    Then I see holiday countdown page and navigate back to home screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page and navigate back to home screen



  @smoke1-de-mt @weather
  Scenario: Check weather page is displayed correctly
    Given I am on Home screen
    When I navigate to weather page using side menu
    Then I see holiday weather page and navigate back to home screen
    When I navigate to weather page using weather biscuit
    Then I see holiday weather page and navigate back to home screen

  @smoke1-de-mt
  Scenario: Check booking summary page is displayed correctly
    Given I am on Home screen
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page and navigate back to home screen
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page and navigate back to home screen

