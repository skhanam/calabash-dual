@nor  @eng @sanity-eng @sanity-nor
Feature: English Sanity Tests

  @offcanvas
  Scenario: Left off canvas Menu listing
    Given I am on Home screen
    Given I have opened side menu
    Then I should see a list of products in booking

  @contact_us-nor
  Scenario: Verify contact us page and external links present
    Given I am on contact us screen
    Then I verify contact us page
