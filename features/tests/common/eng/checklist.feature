 @eng @sanity-eng
Feature: English Sanity Tests

  @verify-package_check_list1
  Scenario: Verify check list item selection
    Given I am on packaging list page
    Then I verify items to pack are 0

  @verify-package_check_list2
  Scenario: Delete packaging list item
    Given I am on Home screen
    When I add a new item with a title
    Then I see item listed under Items to pack
    And I check edit and delete options
    When I delete item added from packaging list

  @first-check_list  @sanity-eng
  Scenario: Verify check list item selection
    Given I am check list page
    When I select first item in check list
    Then I see the selected item under completed items
    When I unselect the select item
    Then I see the item at bottom of check list

  @verify-check_list-items
  Scenario: Verify check list item selection
    Given I am check list page
    When I open to do list
    Then I verify all check list items are shown

  @verify-tab-check_list
  Scenario: Verify check list item selection
    Given I am on Home screen with pre holiday booking
    When I tap on the checklist biscuit on home page
    Then I should be navigated to Checklist page


  Scenario: US16739 uncompleted checklist items
    Given I have a pre-holiday booking with uncompleted checklist items
    When I access  the application homepage
    Then I should see a checklist biscuit with title 'Holiday Checklist'
    And I should see the number of items left to do


  Scenario: US16739 completed checklist items
    Given I have a pre-holiday booking with completed checklist items
    When I access  the application homepage
    Then I should see a checklist biscuit with title 'Checklist complete'
    And I should see a 'tick' icon








