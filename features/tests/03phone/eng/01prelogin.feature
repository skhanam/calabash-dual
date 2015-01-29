@prelogin-phone  @reset @en-phone @working
Feature: Verify pre login screen

  @prelogin4 @eng
  Scenario: Verify book visit in welcome screen
    Given I am booking reference page
    Then I verify retrieve my booking page

  @prelogin5
  Scenario: Verify book visit in welcome screen
    Given I am booking reference page
    When I submit wrong booking details in booking ref page
    Then I see error messages on booking ref page


@eng-welcome
  Scenario: US19425 - UK S&B - Welcome page
    Given I am on 'Welcome' screen
    Then I see the top half has the caption 'Have a booking, Lets login!'
    And the bottom half has the caption 'Havent booked, Lets get inspired!'
