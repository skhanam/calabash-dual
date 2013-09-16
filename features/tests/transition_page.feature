Feature: Transition Page

  As a user on TUI screen with menu items when I tap on a menu item,
  I should be transitioned to the relevant screen
  So I can access information on the new screen

  @smoke
  Scenario: Page Transition 'Tell us about yourself' <=> 'Have you used meine TUI online'

    Given I am on 'Tell us about yourself' page
     And I transit to 'Have you used meine TUI online' page by clicking 'I’m already with TUI'
     When I click back arrow button on 'Have you used meine TUI online' page
    Then  I am back on 'Tell us about yourself' page

#  @smoke
#  Scenario : Page Transition 'Tell us about yourself' <=> 'Explore TUI'
#
#    Given I am on 'Tell us about yourself' page
#    When I click 'I'm new to TUI'
#    Then  I should see 'Explore TUI' page
#    When I click back arrow button
#    Then  I am on 'Tell us about yourself' page
