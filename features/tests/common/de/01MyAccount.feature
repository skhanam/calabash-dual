@android_test @ios_test @myaccount_tests @auto1 @de @working
Feature: Verify My account page and sub pages
  Verify my account page
  Verify change password page
  Verify update email page

  @sanity @myaccount1
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

  @myaccount2
  Scenario: Verify change password page
    Given I choose to change password from my account page
    Then I see change password page

  @myaccount3
  Scenario: Verify update email page
    Given I select update email from my account page
    Then I see update email page