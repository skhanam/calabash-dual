

@ios_test @android_test  @countdown @common-tests
Feature: Verify post Holiday Biscuit


  @post-holiday1 @common-tests
  Scenario:Verify Post Holiday page pop-up
    Given I log into Application
    Then I see the Welcome back pop-over
    When I tap on the OK button
    Then I should be navigated to Post Holiday page


  @reset @post-holiday2 @common-tests
  Scenario: Verify Post Holiday pop-up content
    Given I login with post holiday data
    Then I see the Welcome back pop-over
     And I should see relevant content on post holiday


#    Given I am on home screen with default booking
#    When I navigate to countdown page using countdown biscuit
  #  Then I see holiday countdown page
 #   And I verify number of days left to travel

