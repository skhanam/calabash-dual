Feature: Transition Page

  As a user on TUI screen with menu items when I tap on a menu item,
  I should be transitioned to the relevant screen
  So I can access information on the new screen

  @smoke
  Scenario: Page Transition 'Tell us about yourself' <=> 'Have you used meine TUI online'

    Given I am on 'Tell us about yourself' page
     And I transit to 'Have you used meine TUI online' page by clicking 'I’m already with TUI'
     When I click back on 'Have you used meine TUI online' page
    Then  I am back on 'Tell us about yourself' page

  @smoke
  Scenario: Page Transition 'Tell us about yourself' <=> 'Explore TUI'

    Given I am on 'Tell us about yourself' page
    And I transit to 'Explore TUI' page by clicking 'I’m new to TUI'
    When I click back on 'Explore TUI' page
    Then  I am back on 'Tell us about yourself' page


  @smoke
  Scenario: Page Transition 'Have you used meine TUI online' <=> 'Welcome'

    Given I am on 'Have you used meine TUI online' page
    And I transit to 'Welcome' page by clicking 'That’s great – just use the same log in details to use this app.'
    When I click back on 'Welcome' page
    Then  I am back on 'Have you used meine TUI online' page


  @smoke
  Scenario: Page Transition 'Have you used meine TUI online' <=> 'Sign up'

    Given I am on 'Have you used meine TUI online' page
    And I transit to 'Sign up' page by clicking 'Sign up now using your booking code and start date.'
    When I click back on 'Sign up' page
    Then  I am back on 'Have you used meine TUI online' page