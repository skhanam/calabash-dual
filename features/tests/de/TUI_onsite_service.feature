@ios_test @android_test  @de

Feature: Verify TUI onsite service

  @tui_onsite_service
  Scenario: Verify TUI onsite service
    Given I have switched to typical booking
    And I am on Home screen
    When I navigate to TUI service onsite page
    And I select hotel from TUI service onsite page
    Then I see TUI service onsite page

  @tui_onsite_service
  Scenario: Verify TUI onsite service contact page
    Given I have switched to typical booking
    And I am on Home screen
    When I navigate to TUI service onsite page
    And I select hotel from TUI service onsite page
    Then I see TUI service onsite page
    When I select TUI service contact page
    Then I see TUI contact page



