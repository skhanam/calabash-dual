@android_test @ios_test

Feature: Verify product pages by navigating through side panel
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  Scenario: navigate to countdown page
    Given I am on Home screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page

  Scenario: navigate to weather page
    Given I am on Home screen
    When I navigate to weather page using side menu
    Then I see holiday weather page

  Scenario: navigate to booking summary page
    Given I have switched to typical booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page

  Scenario: Check Navigation menus for Typical booking
    Given I have switched to typical booking
    When I open side panel
    Then I must see below items:
      | My Booking              |
      | Booking summary         |
      | Train                   |
      | Flights                 |
      | Accommodation           |
      | Extra                   |
      | Destination information |
      | Destination guide       |
      | Good to know            |
      | Get in touch            |
      | Travel Agent            |
      | Kontakt                 |
      | My representative       |
      | TUI onsite service      |
      | Kontakt                 |


  Scenario: Check Navigation menus for Single booking
    Given I have switched to single flight booking
    When I open side panel
    Then I must see below items:
      | My Booking              |
      | Booking summary         |
      | flight                  |
      | Extra                   |
      | Destination information |
      | Destination guide       |
      | Get in touch            |
      | Travel Agent            |
      | Kontakt                 |
      | My representative       |
      | TUI onsite service      |
      | Kontakt                 |
