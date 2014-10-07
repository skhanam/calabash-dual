@ios_test @tab
Feature: [US13471] Tablet - UK and DE - Book a holiday page - mosaic page
  Check Book a holiday page journey
  Check weather page and journey is displayed correctly
  Check mosaic page

  @hp1
  Scenario: Scenario: Book a holiday page - mosaic page
    Given I am on the browse-a-holiday page
    When I  tap on a mosaic item
    Then I should see the Holiday Product Detail
    And the holiday product details displayed as specified in story US13471:


