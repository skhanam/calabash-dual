@myaccount_tests-de @reg-de
Feature: Verify My account page and sub pages
  Verify my personal detail  page and other elements
  Verify change password page
  Verify update email page


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
  Scenario: US13645 Error messages
    Given I have accessed my Personal Details page
    When I have entered invalid information on add booking page
    When I submit wrong form details on add booking page
    Then I should see an Error messages displayed on add booking page
    And I should see any inline error messages on add booking page

  @myBookingsPage5
  Scenario: Verify Detail section page
    Given I have accessed my Personal Details page
    When I see add booking biscuit
    And I should see all future booking image biscuits
    And I should see all past booking image biscuits

  Scenario: Verify change email page
    Given I have accessed my Personal Details page
    And I select change email from my personal details page
    Then I verify elements on change email page

  @logout-de
  Scenario: Logout verification on my account page
    Given I have accessed my Personal Details page
    When I tap on Logout
    Then I should see logout OS dialogue displayed
    When I confirm Logout
    Then I should navigate to welcome screen

  @viewbooking
  Scenario: view Bookings
    Given I have accessed my Personal Details page
    When I tap on any booking biscuit
    Then I should see country names on weather biscuit