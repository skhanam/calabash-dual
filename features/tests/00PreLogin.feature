@reset
Feature: Verify screens shown before logging into App
  Verify Welcome Page as registered used
  Verify Welcome Page as unregistered user

  Background:
    Given I am on welcome page

  @android_test
  Scenario: Verify new to TUI page
    When I choose haven't booked through TUI
    Then I see new to TUI page

  @android_test @ios_test @sanity
  Scenario: Already customer and I haven't logged in yet
    When I navigate to new user registration page
    Then I see new user registration page

  @android_test @ios_test
  Scenario: Already customer and I have logged in before
    And I have already registered with TUI
    Then I see login Page

  @ios_test
  Scenario: Verify new to TUI page & check video
    When I choose haven't booked through TUI
    Then I see new to TUI page
    And I check new to TUI video
