@android_test @ios_test  @de @auto4
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

  Scenario: navigate to insurance page
    Given I have switched to insurance booking
    Given I am on Home screen
    When I navigate to insurance page using side menu
    Then I see insurance page

   @typical-sidepanel @sidepanel
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
      | Weather                 |
      | Destination guide       |
      | excursions              |
      | Good to know            |
      | Kontakt heading         |
      | My travel agent         |
      | TUI onsite service      |
      | Kontakt                 |

  @sidepanel
  Scenario: Check Navigation menus for Single booking
    Given I have switched to single flight booking
    When I open side panel
    Then I must see below items on sidepanel for booking:
      | Countdown               |
      | My Booking              |
      | Booking summary         |
      | Flights                 |
      | Weather                 |
      | Destination guide       |
      | excursions              |
      | Good to know            |
      | Kontakt heading         |
      | TUI onsite service      |
      | Kontakt                 |