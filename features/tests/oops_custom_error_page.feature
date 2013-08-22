Feature: Custom error page

  As a user using the TUI app when a severe server error occurs,
  I should be transitioned to an error screen
  So I have an idea of what to do next

  Scenario: Server Error

    Given I have accessed the TUI app
    When the system throws a server 500 error
    Then I should see a new screen with following message "Oops something went wrong. Sorry, some of the content hasn't been loaded correctly. Please try viewing another page or close the app and connect again later.

  Scenario: Internet required

    Given I have accessed the TUI app
    When the application loses it connection to the internet
    Then I should see a new screen with the following message "Internet required...