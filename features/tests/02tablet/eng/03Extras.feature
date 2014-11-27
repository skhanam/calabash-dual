#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@extras-tests @tab @reg-en
Feature: US16740	Holiday Extras Biscuit

  @extra1
  Scenario: US16740 Holiday extras Biscuit
    Given I have a pre-holiday booking
    When I access  the application home page
    Then I swipe to see "extras Biscuit"
    Then I should see an Holiday extras Biscuit appear

  @extra2
  Scenario: US16740 OnTap extras
    Given I can see the Holiday extras Biscuit
    When I tap on the Holiday extras Biscuit
    Then I should be navigated to Holiday extras page
#
#  @noexcursions @reset
#  Scenario: US16740 OnTap extras
#    Given I log into App using no excursions booking
#    Given I can see the Holiday extras Biscuit
#    When I tap on the Holiday extras Biscuit
#    Then I should be navigated to Holiday extras page
#    Then I log out from application
