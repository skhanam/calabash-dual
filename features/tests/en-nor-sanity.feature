@nor  @eng @sanity-eng @sanity-nor
Feature: English Sanity Tests

  @offcanvas @failed
  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in booking

