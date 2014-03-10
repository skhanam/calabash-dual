@ios_test @android_test @login1 @auto3
Feature: Verify meet representative page

  Scenario: Verify meet representative page
    Given I have switched to typical booking
    Given I navigate to meet representative page from side panel
    Then I must see name of representative
