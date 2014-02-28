@ios_test @android_test
Feature: Currency converter
  As a TUI client with a TUI booking
  I should be able to access the currency converter page
  So I can find out the locale conversion rate

  @run
  Scenario: Check currency conversion
    Given I have switched to non eu booking
    And I navigate to curreny converter page from home screen
    Then I see conversion rate for 400 euros

#    Given I am on the TUI app Currency Converter page
#    When I enter a currency <amount>  in the default euro field
#    Then the <converted rate amount> should appear in the equivalent amount field
#  Examples:
#  |Euro Amount | Destination Amount |
#  |  €400		 |      £341 GB            |
#  |  €400		 |      $527 USD         |
