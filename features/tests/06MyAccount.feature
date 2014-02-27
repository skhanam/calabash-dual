@android_test @ios_test @myaccount_tests
Feature: Verify My account page and sub pages
  Verify my account page
  Verify change password page
  Verify update email page

  @sanity
  Scenario: Verify my account page
    Given I am on my account page
    Then I verify below details on account page:
      | username               |
      | first name             |
      | surname                |
      | email                  |
      | update email button    |
      | password change button |
      | newsletter             |
      | logout                 |

  Scenario: Verify change password page
    Given I choose to change password from my account page
    Then I see change password page

  Scenario: Verify update email page
    Given I select update email from my account page
    Then I see update email page