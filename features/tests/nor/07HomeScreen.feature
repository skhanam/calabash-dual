@android_test @ios_test @home_screen_nor @nor
Feature: Check home screen biscuits

  @taxfree_biscuit
  Scenario: Check tax free biscuit
    Given I am on home screen with default booking
    Then I verify taxfree biscuit on home page

  @bookingsummary_biscuit
  Scenario: Check tax free biscuit
    Given I am on home screen with default booking
    When I select booking summary biscuit on home page
    Then I see holiday booking summary page

  @guide_online_biscuit
  Scenario: Check guide online biscuit
    Given I am on home screen with default booking
    When I select guide online biscuit on home page
    Then I see guide online page

  @destination1
  Scenario: Open Destination page from home page biscuit
    Given I am on home screen with default booking
    When I select destination biscuit
    Then I see destination information page

  @destination2
  Scenario: Verify Destination page
    Given I am on home screen with default booking
    When I select destination biscuit
    Then I see destination information page
    And I verify destination information page

