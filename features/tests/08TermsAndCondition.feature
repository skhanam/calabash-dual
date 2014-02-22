@ios_test @android_test @login1
Feature: Verify Terms and Conditions page

  Scenario: Verify Terms and Conditions page
    Given I navigate to terms page from side panel
    Then I see terms page is displayed correctly

  Scenario: Verify contact details on Terms and conditions page
    Given I navigate to terms page from side panel
    Then I must see name of representative
    And contact details of representative