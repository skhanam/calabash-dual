@android_test @ios_test
Feature: Verify product pages by navigating through side panel
  Check countdown page is displayed correctly
  Check weather page is displayed correctly
  Check booking summary page is displayed correctly

  @good_to_know
  Scenario: navigate to good to know page
    Given I have switched to single booking
    Given I am on Home screen
    When I navigate to good to know page using side menu
    Then I see good to know page

  @travel_agent
  Scenario: navigate to my travel agent page
    Given I have switched to single booking
    Given I am on Home screen
    When I navigate to my travel agent page
    Then I see my travel agent page

  Scenario: navigate to countdown page
    Given I have switched to typical booking
    Given I am on Home screen
    When I navigate to countdown page using side menu
    Then I see holiday countdown page

  @sanity
  Scenario: navigate to weather page
    Given I have switched to typical booking
    Given I am on Home screen
    When I navigate to weather page using side menu
    Then I see holiday weather page

  Scenario: navigate to insurance page
    Given I have switched to insurance booking
    Given I am on Home screen
    When I navigate to insurance page using side menu
    Then I see insurance page


  @sanity
  Scenario: navigate to booking summary page
    Given I have switched to typical booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page

  @failed
  Scenario: Check Navigation menus for Typical booking
    Given I have switched to typical booking
    When I open side panel
    Then I must see below items on sidepanel for booking:
      | Countdown               |
      | My Booking              |
      | Booking summary         |
      | Flights                 |
      | Hotel                   |
      | Insurance               |
      | Extra                   |
      | Destination information |
      | Weather                 |
      | Destination guide       |
      | excursions              |
      | Good to know            |
      | My travel agent         |
      | Kontakt heading         |
      | My travel agent         |
      | TUI onsite service      |
      | Kontakt                 |

  Scenario: Check Navigation menus for Single booking
    Given I have switched to single flight booking
    When I open side panel
    Then I must see below items on sidepanel for booking:
      | Countdown               |
      | My Booking              |
      | Booking summary         |
      | Flights                 |
      | Destination information |
      | Weather                 |
      | Destination guide       |
      | excursions              |
      | Good to know            |
      | Kontakt heading         |
      | My travel agent         |
      | TUI onsite service      |
      | Kontakt                 |