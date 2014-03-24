@ios_test @android_test

Feature: Verify contact us page

  Background:
    Given I have switched to typical booking

  @sanity
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
    Then I must see terms and conditions page

  Scenario: check TUI service screen from contact us
    Given I am on contact us screen
    When I select TUI service onsite link on contact us page
    Then I see TUI service onsite page