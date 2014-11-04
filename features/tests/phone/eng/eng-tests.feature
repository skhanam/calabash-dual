 @eng @sanity-eng
Feature: English Sanity Tests

  @verify-package_check_list1
  Scenario: Verify check list item selection
    Given I am on packaging list page
    Then I verify items to pack are 0

  @verify-package_check_list2
  Scenario: Delete packaging list item
    Given I am on packaging list page
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

  @verify-check_list
  Scenario: Verify check list item selection
    Given I am check list page
    When I open to do list
    Then I verify all check list items are shown

  @currency_conv
  Scenario: Check currency converter screen
    Given I am on Home screen
    And I navigate to travel money page from home screen

  @currency_conv2
  Scenario: Check currency converter screen
    Given I am on Home screen
    And I navigate to currency page from travel money page
    Then I verify currency page

  @currency_conv3
  Scenario: Check currency converter screen
    Given I am on Home screen
    And I navigate to money on card page from travel money page
    Then I verify money on card page

  @contactus3
  Scenario: Verify CTA links on contact us page
    Given I am on Home screen
    And I navigate to contact us page using side menu
    Then I see contact us page
    And I verify cta links on contact us page

