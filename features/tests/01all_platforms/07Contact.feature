@android_test @ios_test  @reg
Feature: Verify contact page

  @contact1
  Scenario: US13501 Verify Tablet contact page
    Given I am on Home screen
    When I navigate to contact us page using side menu
    Then I verify contact us page