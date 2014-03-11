@ios_test @android_test @login1 @auto3
Feature: Verify my tour guide

  Scenario: Verify my tour guide page
    Given I have switched to typical booking
    Given I navigate to my tour guide page from side panel
    Then I see my tour guide is displayed correctly
    Then I must see name of my tour guide

  Scenario: Verify my tour guide from home screen
    Given I have switched to typical booking
    Given I navigate to my tour guide page from home page
    Then I see my tour guide is displayed correctly
    Then I must see name of my tour guide

