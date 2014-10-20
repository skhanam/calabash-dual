@tab
Feature: US14552 Off canvas Menu Items

  @tab-sidepanel2 @reg-de @5552
  Scenario: Homepage assemblage
    Given I am on Home screen
    When I open side panel
    Then I must see below items on sidepanel for booking:
      | Home                           |
      | Holiday summary                |
      | Countdown                      |
      | Weather                        |
      | Destination                    |
#      | Excursions                     |
      | Currency Converter             |
      | Important Information          |
      | Contact Us                     |
      | App Feedback                   |
      | Logout                         |
      | Browse our holiday collections |
