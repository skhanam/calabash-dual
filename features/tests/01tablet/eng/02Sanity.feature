@reg-en @tab @reg-en
Feature: US14552 Off canvas Menu Items

  @tab-sidepanel1 @device @reset
  Scenario: Homepage assemblage
    Given I am on Home screen
    When I open side panel
    Then I must see below items on sidepanel for booking:
      | Home                           |
      | Holiday summary                |
      | Countdown                      |
      | Weather                        |
      | Extras                         |
      | Destination                    |
      | Excursions                     |
      | Holiday checklist              |
      | My Messages                    |
      | Currency Converter             |
      | Important Information          |
      | Contact Us                     |
      | App Feedback                   |
      | Logout                         |
      | Browse our holiday collections |



