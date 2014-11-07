#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@extras-tests
Feature: US16740	Holiday Extras Biscuit

  @bis1
  Scenario: US16740 Holiday extras Biscuit
    Given I have a pre-holiday booking
    When I access  the application home page
    Then I swipe to see "extras Biscuit" is removed

  @home-weather2
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with multi destination booking
    Then I should see a Weather Biscuit appear
    And  I should see Weather Biscuit display weather for each destination in a loop of 5s

  @tab-excursions3
  Scenario: OnTap Excursions
    Given I am on Home screen with pre holiday booking
    When I select Excursions Biscuit for second destination
    Then I should be navigated to Excursions Mosaic page
    And I see excursions - Mosaic landing page
