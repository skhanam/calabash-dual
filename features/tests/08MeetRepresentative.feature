@ios_test @android_test
Feature: Verify meet representative page


  Scenario: Verify meet representative page
    Given I navigate to terms page from side panel
    Then I see terms page is displayed correctly

  Scenario: Verify links on Terms and conditions page
    Given I navigate to terms page from side panel
    Then I verify below links on terms page
      | call us          |
      | Send us email    |
      | TUI service form |








