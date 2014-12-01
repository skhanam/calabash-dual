@reg-tab-de
Feature: Verify product pages by navigating through side panel

  @multi_dest
  Scenario: Multiple destinations
    Given I have a pre-holiday booking
    And I have multiple destinations in my booking
    When I open side panel
    Then I should see one menu entry per destination
    And I should see the destination name on the menu

  @tab-sidepanel2  @5552
  Scenario: Homepage assemblage
    Given I am on Home screen
    When I open side panel
    Then I must see below items on sidepanel for booking:
      | Home                           |
      | Holiday summary                |
      | Countdown                      |
      | Weather                        |
      | Destination                    |
      | Excursions                     |
      | Important Information          |
      | Contact Us                     |
      | App Feedback                   |
      | Logout                         |


  @de-ds1
  Scenario: Navigate to destination guide page and verify list of destinations
    Given I am on Home screen
    Then I see list of destinations in sidepanel in meine TUI

#  Scenario: US13503	UK holiday extras  Verify page elements
#    Given I have a pre-holiday booking
#    Then I have navigated to UK holiday extras - Mosaic landing page
#    When the Mosiac landing page loads
#    Then I should see Mosaic items  animate in individually to build mosaic
#    And I should see the off canvas menu button
#    And I should see app name logo centred
#    And I should see the displayed extra in 1,2,3 and max 4 blocks
#    And I should observe the   extra page scrolls vertically
#    And I should see Holiday extras items display title and prompt