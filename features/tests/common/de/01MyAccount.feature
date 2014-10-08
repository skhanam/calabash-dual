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


  @myBookingsPage
  Scenario: US13492 DE Profile section - add a booking  READY
    Given I have accessed my Personal Details page
    When I select add Booking biscuit
    Then I see add a booking page
    And I should see title and subtitle on add booking page
    And I should input fields for booking details on add booking page
    And I should see find booking text on add booking page
    And I should see Help email on add booking page

  @myBookingsPage2
  Scenario: Error messages
    Given I have accessed my Personal Details page
    When I have entered invalid information on add booking page
    When I submit wrong form details on add booking page
    Then I should see an Error messages displayed on add booking page
    And I should see any inline error messages on add booking page

  Scenario: Change email
    Given I have accessed my Personal Details page
    When I select change email from my personal details page
    Then I see close button on change email page
    Then I see change email page
    And I see email title and information text on change email page
    And email and password fields on change email page
    And I should see the Submit button on change email page
    And I should see Forgot Password Link CTA on change email page

  Scenario: Verify Detail section page
    Given I have accessed my Personal Details page
    When I see add booking biscuit
    And I should see all future booking image biscuits
    And I should see all past booking image biscuits
    Then I should see Browse Holiday collection biscuit

  Scenario: Verify change email page
    Given I have accessed my Personal Details page
    And I select change email from my personal details page
    Then I see change email page

  Scenario: Verify change password page
    Given I have accessed my Personal Details page
    And I choose to change password from my account page
    Then I see change password page

  Scenario: Logout verification on my account page
    Given I have accessed my Personal Details page
    When I tap on Logout
    Then I should see logout OS dialogue displayed
    When I confirm Logout
    Then I should navigate to welcome screen

  Scenario: Add Booking
    Given I have accessed my Personal Details page
    When I tap on Add Booking biscuit
    Then I should see Add Booking form displayed

  Scenario: view Bookings
    Given I have accessed my Personal Details page
    When I tap on any booking biscuit
    Then I should observe that the app homepage view has the selected booking loaded