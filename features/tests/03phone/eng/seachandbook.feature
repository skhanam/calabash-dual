@en-phone @working @ph-searchbook @reset @en-phone
Feature: English Sanity Tests

  Scenario: Selecting top half of welcome screen takes user to login screen
    Given I am on 'Welcome' screen
    When I tap on the top half of welcome page
    Then I am on 'Login' screen

  Scenario: Selecting bottom half of welcome screen takes user to search and book screen
    Given I am on 'Welcome' screen
    When I tap on the bottom half of welcome page
    Then I am on search and book screen

  Scenario: Navigating back from search and book screen shows welcome screen
    Given I have navigated to search and book screen
    When I tap the back arrow on search and book
    Then I am on 'Welcome' screen

  Scenario: See sign up for offers on search and book screen
    Given I have navigated to sign up offers screen from welcome screen
    When I tap the back arrow on sign up offers
    Then I am on search and book screen
    And I see Sign Up For Offers on search and book screen

  Scenario: Navigate to each tile of search and book screen
    Given I have navigated to search and book screen
    Then I am on search and book screen
    Then I check each tile of each row in search and book screen

  Scenario: US19542 - UK S&B - Access from Off canvas
    Given I am on home screen with default booking
    And I open side panel
    Then I see a search and book banner with title is Browse our Holiday collections

  Scenario:  US19656 - UK S&B - Sign up for Offers page - DONE
    Given I have navigated to sign up offers screen from welcome screen
    Then I verify below elements on Sign Up For Offers page "Title, First Name, Last Name & Email address"
    And I verify below options in Sign Up For Offers page "Opt in text, Privacy policy, Submit"

  @ios_only
  Scenario: Submit button is disabled
    Given I have navigated to sign up offers screen from welcome screen
    And I have not entered any fields on search and book screen
    Then the submit button is disabled on search and book screen

  Scenario: US18485 - UK S&B - submit correct credentials
    Given I have navigated to sign up offers screen from welcome screen
    Then I see email field with pre filled text on search and book page
    When I submit email id and expect appropriate message:
      | aaaaaa     | Please enter a valid email address |
      | aaa@bbb    | Please enter a valid email address |
      | ccccc@dddd | Please enter a valid email address |
      | a@b.com    | no error                           |
      | a@b.co.uk  | no error                           |

  Scenario: US18485 - UK S&B navigating back to search book
    Given I have navigated to search and book screen
    And I select first tile on Excursions
    Then in-app browser opens displaying the respective page
    When I tap the back arrow on search and book webview
    Then I am on search and book screen
    Then I am on same position in Search book screen

  Scenario: US18485 - UK S&B navigating back to search book
    Given I have navigated to search and book screen
    And I select first tile on Excursions
    Then in-app browser opens displaying the respective page
    When I tap the back arrow on search and book webview
    Then I am on search and book screen
    Then I am on same position in Search book screen

  Scenario: US18485 - UK S&B check search and book tile
    Given I have navigated to search and book screen
    And I tap on the search and book tile
    Then in-app browser opens displaying the respective page

#  @testnow
#  Scenario: S & B submit sign up details
#    Given I have navigated to sign up offers screen from welcome screen
#    Given I have filled in valid data and ticked both check boxes on sign up offers screen
#    And I Submit details on sign up offers screen
#    Then a Blue box is displayed at the top of sign up offers screen
#    And with Thanks for signing up message
