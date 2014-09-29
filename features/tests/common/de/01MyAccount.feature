@android_test @ios_test @myaccount_tests @auto1 @de  @tab-de
Feature: Verify My account page and sub pages
  Verify my personal detail  page and other elements
  Verify change password page
  Verify update email page

  @sanity 
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

  Scenario: Verify Detail section page
    Given I have accessed my Personal Details page
    When I see add booking biscuit
    And I should see all future booking image biscuits
    And I should see all past booking image biscuits
    Then I should see Browse Holiday collection biscuit

  Scenario: Verify change email page
    Given I have accessed my Personal Details page
    And I select update email from my account page
    Then I see update email page

  Scenario: Verify change password page
    Given I have accessed my Personal Details page
    And I choose to change password from my account page
    Then I see change password page

  Scenario: Logout verification on my account page
    Given I have accessed my Personal Details page
    When I tap on Logout
    Then I should see logout OS dialogue displayed

  Scenario: Add Booking
    Given I have accessed my Personal Details page
    When I tap on Add Booking biscuit
    Then I should see Add Booking form displayed

  Scenario: view Bookings
    Given I have accessed my Personal Details page
    When I tap on any booking biscuit
    Then I should observe that the app homepage view has the selected booking loaded