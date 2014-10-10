@android_test @ios_test  @de @auto4
Feature: Verify product pages by navigating through side panel

  @multi_dest
  Scenario: Multiple destinations
    Given I have a pre-holiday booking
    And I have multiple destinations in my booking
    When I open side panel
    Then I should see one menu entry per destination
    And I should see the destination name on the menu
#    And I should see the name truncated when it's too long
