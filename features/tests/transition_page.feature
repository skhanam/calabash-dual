#Feature: Transition Page
#
#  As a user on TUI screen with menu items when I tap on a menu item,
#  I should be transitioned to the relevant screen
#  So I can access information on the new screen
#
#  Scenario : Navigate to next screen
#
#    Given I am on a TUI app screen with navigational arrows to tap
#    And I tap an option with a forward arrow
#    When I see the option in tapped state
#    Then I should see the page transition to relevant subsequent screen
#
#  Scenario : Navigate to previous screen
#
#    Given I have tapped an option with a back arrow
#    When I see the option in tapped state
#    Then I should see the page transition to previous preceding screen