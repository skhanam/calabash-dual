@android_test @ios_test @taxfree @nor-ph
Feature: Verify Tax free features

  @taxfree1
  Scenario: Check Tax free screen
    Given I am on home screen with default booking
    When I navigate to Taxfree page using side menu
    Then I see Taxfree page

  @taxfree2  @nor-failing
  Scenario: Check links on Tax free screen
    Given I am on home screen with default booking
    When I navigate to Taxfree page using side menu
    Then I see Taxfree page
    When I select links on Taxfree screen
    Then I see webview for Taxfree being displayed

