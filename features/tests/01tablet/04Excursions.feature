#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@weather @common-tests @tab-excursions @tab @reg
Feature: US13695 DE Excursions - Detail Page

  @tab-excursions1
  Scenario: OnTap Excursions
    Given I am on Home screen with pre holiday booking
    When I select Excursions Biscuit on home page
    Then I should be navigated to Excursions Mosaic page