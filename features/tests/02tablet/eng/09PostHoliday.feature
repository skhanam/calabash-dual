@reg-tab-en @post-holiday @and-tab-done
Feature: Verify post Holiday Biscuit

  @ph1 @reset
  Scenario:Verify Post Holiday page pop-up
    Given I login with post holiday data
    Then I see the Welcome back pop-over
    When I tap on Post Holiday OK button
    Then I should be navigated to Post Holiday page
    And I must see welcome back message

  @ph2 @reset
  Scenario: Verify Post Holiday pop-up content
    Given I login with post holiday data
    Then I see the Welcome back pop-over
    And I should see relevant content on post holiday popup

  @ph3 @reset @reset-after
  Scenario: Verify Post Holiday pop-up content
    Given I login with post holiday data
    And Then I should navigated to Post Holiday page and see all information
    And I log out from post holiday screen
    And I see welcome screen
