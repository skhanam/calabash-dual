@test1  @ios_test @android_test
Feature: Verify contact us page

  Scenario: check contact us page
    Given I am on contact us screen
    Then I verify below details on contact page:
      | First name |
      | Surname    |
      | email      |
    And contact page is displayed with necessary information









