#Feature: Tell Us About Yourself
#
#  As a logged out user accessing the TUI app,
#  I should be presented with a 'Tell us about yourself' screen
#  So I can select between existing or new customer of TUI
#
#  Scenario: Screen Prior to Have you used meine TUI online
#
#    Given I have just gone past the splash screen
#    When I see the 'Tell us about yourself' screen
#    Then I should see two tap-able options: I'm already with TUI I'm new to TUI
#
#  Scenario: I'm already with TUI
#
#    Given I have tapped on the 'I'm already with TUI' option
#    When I see the 'I'm already with TUI' option in tapped state
#    Then I should see the page transition to 'Have you used meine TUI online' screen
#
#  Scenario: I'm new to TUI
#
#    Given I have tapped on the 'I'm new to TUI' option
#    When I see the 'I'm new to TUI' option in tapped state
#    Then I should see the page transition to a 'Sales' screen