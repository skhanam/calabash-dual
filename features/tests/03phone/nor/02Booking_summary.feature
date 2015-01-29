@ios_test @android_test  @nor-ph

Feature: Verify booking summary page

  @booking-nor1 @basic-sanity @nor-failing
  Scenario: Verify summary page
    Given I am on home screen with default booking
    When I navigate to booking summary page using side menu
    Then I verify booking summary page