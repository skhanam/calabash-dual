@android_test @ios_test @myaccount_tests
Feature: Verify My account page and sub pages


  Scenario: Verify my account page
    Given I am on my bookings page
    When I click on edit account button from my bookings page
    Then I see my account page
    And verify my details on account page

  Scenario: Verify change password page from my account page
    Given I am on my account page
    When I select change password from my account page
    Then I see change password page

  Scenario: Verify update email page from my account page
    Given I am on my account page
    When I select update email from my account page
    Then I see update email page



