@android_test @ios_test @myaccount_tests @auto1 @de
Feature: Verify My account page and sub pages
  Verify my personal detail  page and other elements
  Verify change password page
  Verify update email page

  @sanity @myaccount1
  Scenario: Verify my account page Off canvas section
    Given I have accessed my Personal Details page
    Then I verify below details on account page:
      | username               |
      | first name             |
      | surname                |
      | email                  |
      | update email button    |
      | password change button |
      | newsletter             |
      | logout                 |

  @myaccount4
  Scenario: Verify Detail section page
    Given I have accessed my Personal Details page
    When I see add booking biscuit
    And I should see all future booking image biscuits
    And I should see all past booking image biscuits
    Then I should see Browse Holiday collection biscuit


  @reset @myaccount2
  Scenario: Verify change password page
    Given I have accessed my Personal Details page
    And I choose to change password from my account page
    Then I see change password page

  @myaccount3
  Scenario: Verify change email page
    Given I have accessed my Personal Details page
    And I select update email from my account page
    Then I see update email page