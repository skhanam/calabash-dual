@myaccount_tests-de @reg-de
Feature: Verify My account page and sub pages
  Verify my personal detail  page and other elements
  Verify change password page
  Verify update email page

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

  @myBookingsPage4
  Scenario: US13645 verify change password page is prefilled
    Given I am on change email page
    When I select change password CTA on change email page
    Then I see change password page
    And I see username or email prefilled on change email page

  @myBookingsPage3
  Scenario: US13645 Change email
    Given I have accessed my Personal Details page
    When I select change email from my personal details page
    Then I see close button on change email page
    Then I verify elements on change email page

  @profile-change-password
  Scenario: US13646 Verify change password page
    Given I have accessed my Personal Details page
    And I choose to change password from my account page
    Then I see change password page

  @add-booking
  Scenario: Verify Add booking page
    Given I am on my bookings page
    When I navigate to add a booking page
    Then I see add a booking page
