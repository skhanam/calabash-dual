@ios_test @android_test @common-tests

Feature: Verify booking summary page

  @booking-nor1
  Scenario: navigate to booking summary page
    Given I have home screen with default booking
    When I navigate to booking summary page using side menu
    Then I see holiday booking summary page