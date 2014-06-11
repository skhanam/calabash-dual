@ios_test @android_test  @app-feedback @common-tests
Feature: Verify App feedback page

  @reset @basic-sanity
  Scenario: Verify App feedback page
    Given I am on home screen with default booking
    When I navigate to App feedback page
    Then I see app feedback page

  @app-feedback2
  Scenario: Verify App feedback page
    Given I am on home screen with default booking
    When I navigate to App feedback page
    And  I submit default rating App feedback page
    Then verify rating submitted message

  @app-feedback3
  Scenario: Verify change app feedback rating page
    Given I have submitted default rating
    When I select change rating on feedback submitted page
    Then I see app feedback page

  @app-feedback4
  Scenario: Change app feedback rating page and verify page
    Given I have submitted default rating
    When I select change rating on feedback submitted page
    Then I see app feedback page
    When  I submit default rating App feedback page
    Then verify rating submitted message

