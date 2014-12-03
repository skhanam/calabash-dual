@android_test @ios_test @home_screen_nor @nor-ph
Feature: Check home screen biscuits

  @taxfree_biscuit
  Scenario: Check tax free biscuit
    Given I am on home screen with default booking
    Then I verify taxfree biscuit on home page


  @destination1 @nor-failing
  Scenario: Open Destination page from home page biscuit
    Given I am on home screen with default booking
    When I select destination biscuit
    Then I see destination information page

  @destination2 @nor-failing
  Scenario: Verify Destination page
    Given I am on home screen with default booking
    When I select destination biscuit
    Then I see destination information page
    And I verify destination information page

