#test cases are present in - https://akqa-lon3.ontestpad.com/project/136/
@weather @common-tests @tab-weather @tab @reg
Feature: Verify Weather details for bookings

  @home-weather1 @tab-sanity
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with pre holiday booking
    Then I should see a Weather Biscuit appear
    And I should see Weather type icon
    And I should see country name


  @home-weather3
  Scenario: US16737 Verify Weather Biscuit
    Given I am on Home screen with multi destination booking
    Then I should see a Weather Biscuit appear
    When I navigate to weather page using weather biscuit
    Then I see holiday weather page
