@nor @sanity-nor
Feature: English Sanity Tests

  @booking-nor2
  Scenario: navigate to booking summary page
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page


  @booking-nor2
  Scenario: navigate to booking summary page
    Given I am on Home screen
    When I navigate to booking summary page using booking summary biscuit
    Then I see holiday booking summary page
