#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@weather @common-tests @tab-weather @tab @reg
Feature: US13695 DE Excursions - Detail Page

  @tab-excursions
  Scenario: OnTap Excursions
    Given I am on Home screen with pre holiday booking
    When I select Excursions Biscuit on home page
    Then I should be navigated to Excursions Mosaic page

  @tab-excursions
  Scenario: OnTap Excursions
    Given I am on Home screen with pre holiday booking
    When I select Excursions Biscuit on home page
    Then I should be navigated to Excursions Mosaic page

  @tab-excursions
  Scenario: OnTap Excursions
    Given I am on Home screen with pre holiday booking
    When I select Excursions Biscuit on home page
    Then I should be navigated to Excursions Mosaic page
    And I see excursions - Mosaic landing page


#    Scenario: Verify page elements
#    Given that I have navigated to DE excursions - Mosaic landing page
#    When I tap on an excursion to select it
#    Then I should see the excursion product detail page
#    And I should see  close button; top; center
#    And I should see a carousel with all available images for selected excursion
#    And I should see  ALL AVAILABLE INFORMATION ABOUT THE EXCURSION
#    And I should see  selected excursion detail copy in 2 column layout
#  //EXAMPLE BELOW:
#  //Column 1:
#    And I should see  excursion title
#    And I should see  excursion categories; separated by I; (i.e. Culture & Sights | Moderate
#    And I should see  excursion description
#    And I should see  excursion inclusions
#    And I should see  excursion exclusions
#    And I should see  excursion restrictions
#    And I should see  excursion 'other' information
#    And I should {email button} "Share by email"
#    And I should see {facebook button} "Share on Facebook"
#    And I should see{twitter button} "Share on Twitter"
#  //Column 2:
#    And I should see  excursion adult price;
#    And I should see  excursion child price{if applicable}
#    And I should see  excursion duration
#    And I should see  excursion itinerary
#    And I should see  large 'Send us an email' button;
