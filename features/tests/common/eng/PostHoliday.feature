@ios_test @android_test  @countdown @common-tests @tab @reg-en
Feature: Verify post Holiday Biscuit

  @reset @post-holiday1 @common-tests
  Scenario:Verify Post Holiday page pop-up
    Given I login with post holiday data
    Then I see the Welcome back pop-over
    When I tap on Post Holiday OK button
    Then I should be navigated to Post Holiday page
    And I must see welcome back message

  @reset @post-holiday2 @common-tests
  Scenario: Verify Post Holiday pop-up content
    Given I login with post holiday data
    Then I see the Welcome back pop-over
    And I should see relevant content on post holiday popup

  @reset @post-holiday3 @common-tests
  Scenario: Verify Post Holiday pop-up content
    Given I login with post holiday data
    And Then I should navigated to Post Holiday page and see all information
