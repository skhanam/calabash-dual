@tab-en @reg-en
Feature: T0.5 US13575 UK Login

  @prelogin112 @reset
  Scenario: Check Page elements
    Given I am on 'Login' screen
    And I should see Heading - Login
    And I should see Surname field Pre populated with 'Enter surname' with info button
    And I should see Date field Pre populated with 'Departure date' with info button
    And I should see Booking reference number pre-filled with 1234 12345678
    And I should see Large Disabled Login button
    And I should see Arrow CTA Retrieve my booking

  @prelogin11232
  Scenario: Information Tooltips
    Given I am on 'Login' screen
    When I tap the 'i' icons in the form fields
    Then I should see a relevant tool tip for each i icon

  @prelogin112321
  Scenario: Enable login
    Given I am on 'Login' screen
    When I have populated the form completely
    Then the login button should be enabled

   @pre-filled-text
  Scenario: Pre-filled Text
    Given I am on 'Login' screen
    When  I enter the first character in a pre-filled field
    Then I should see the pre-filled text  disappear

#  @@welcome_login_surname_hint = get_localized_string "welcome_login_surname_hint"
#  @@welcome_login_surname_extra = get_localized_string "welcome_login_surname_extra"
#  @@welcome_login_departure_date = get_localized_string "welcome_login_departure_date"
#  @@welcome_login_departure_date_extra = get_localized_string "welcome_login_departure_date_extra"
#
#  @@welcome_login_booking_reference2_hint = get_localized_string "welcome_login_booking_reference2_hint"
#  @@welcome_login_booking_reference1_hint = get_localized_string "welcome_login_booking_reference1_hint"
#  @@welcome_login_booking_ref_hint = get_localized_string "welcome_help_retrieve_booking_ref_validation"
