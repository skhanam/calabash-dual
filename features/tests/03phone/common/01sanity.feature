@common-phone @auto1 @sanity-all @common-phone
Feature: Login and Home page features
  Login into application

  @basic-sanity @check1 @ss
  Scenario: Check Navigation menus
    Given I am on default booking
    Given I am on Home screen
    Then I navigate to each item and navigate back to home screen
      | Countdown       |
      | Holiday summary |
      | Weather         |
      | Flight          |
      | Hotel           |
      | Contact us      |
      | App Feedback    |