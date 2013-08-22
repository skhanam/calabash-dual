Feature: Have You Used Meine TUI ONline

  As a logged out user already with TUI
  I should be presented with a 'Have you used meine TUI online' screen
  So I can select between previously logged in or not previously logged in

  Scenario: Screen Prior to TUI login

    Given I have just gone past the 'Tell us about yourself' screen
    When I see the 'Have you used meine TUI online' screen
    Then I should see two tap-able options: I have logged in before I haven't logged in yet

  Scenario: I have logged in before

    Given I have tapped on the 'I have logged in before' option
    When I see the 'I' have logged in before' option in tapped state
    Then I should see the page transition to the 'Login' screen

  Scenario: I haven't logged in yet

    Given I have tapped on the 'I haven't logged in yet' option
    When I see the 'I haven't logged in yet' option in tapped state
    Then I should see the page transition to the 'Sign up' screen