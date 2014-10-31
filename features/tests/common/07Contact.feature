@android_test @ios_test @common-tests @reg
Feature: Verify contact page

  @contact1 @device
  Scenario: Verify Tablet contact page
    Given I am on Home screen
    When I navigate to contact us page using side menu
    Then I verify contact us page