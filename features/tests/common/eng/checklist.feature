@eng @sanity-eng
Feature: English Sanity Tests


  Scenario: uncompleted checklist items
    Given I am on Home screen with pre holiday booking
    When I swipe to see "checklist Biscuit"
    And I should see the number of items left to do on checklist biscuit

  @verify-tab-check_list
  Scenario: Verify check list item selection
    Given I am on Home screen with pre holiday booking
    When I tap on the checklist biscuit on home page
    Then I should be navigated to Checklist page

  @verify-package_check_list1
  Scenario: Verify check list item selection
    Given I am on packaging list page
    Then I verify are no items to pack