@test1  @ios_test @android_test
Feature: Verify contact us page

  Scenario: check contact us page
    Given I am on contact us screen
    Then I verify below details on contact page:
      | First name |
      | Surname    |
      | email      |
    And contact page is displayed with necessary information

  Scenario: check Terms and conditions screen from contact us
    Given I am on contact us screen
    And I navigate to terms and conditions page
    Then I must see  terms and conditions page


  Scenario: check Terms and conditions screen from contact us
    Given I am on contact us screen
    And I navigate to TUI service onsite page
    Then I must see TUI service onsite page











