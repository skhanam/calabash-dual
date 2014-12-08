@common-phone @ph-booking

Feature: Verify booking summary page

  @ph-booking1
  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page
    Then I see and verify holiday booking summary page
    Then I wait for "<string>" to appear

  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page
    And list of my flights in booking summary

  Scenario: navigate to booking summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page
    And list of my hotels in booking summary
