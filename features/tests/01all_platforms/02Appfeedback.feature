@app-feedback @sanity @reg
Feature: Verify App feedback page

  @reset @app-feedback1
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
  Scenario: Change app rating on App feedback page
    Given I have submitted default rating
    When I select change rating on feedback submitted page
    Then I see app feedback page

  @app-feedback4
  Scenario: Change and resubmit default rating
    Given I have submitted default rating
    When I select change rating on feedback submitted page
    Then I see app feedback page
    When  I submit default rating App feedback page
    Then verify rating submitted message

