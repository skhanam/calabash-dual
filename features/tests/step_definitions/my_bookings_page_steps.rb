Then(/^I see my bookings page$/) do
  @myBookingsPage.check_my_bookings_page
end

And(/^read my bookings into user details$/) do
  @myBookingsPage.fill_user_details
end

When(/^I click on edit account button from my bookings page$/) do
  @myBookingsPage.navigate_to_account_details
end


When(/^I switch to a booking in past$/) do
  $selected_booking="past"
  @myBookingsPage.click_booking_in_past
end

Then(/^I verify welcome message for booking in past$/) do
  step "I am on Home screen"
  @homePage.check_booking_in_past_message(@booking_in_past_message)
end

Given(/^I am on my bookings page$/) do
  step "I am on Home screen"
  step "I navigate to my bookings page"
  step "I see my bookings page"
end

When(/^I navigate to add a booking page$/) do
  @myBookingsPage.click_add_a_booking_button
end

Then(/^I see add a booking screen/) do
  @myBookingsPage.check_add_booking_screen
end

Then(/^I see add a booking page$/) do
  @myBookingsPage.check_add_booking_page
end

And(/^I should see all future booking image biscuits$/) do
  @myBookingsPage.check_all_future_booking_biscuits
end

And(/^I should see all past booking image biscuits$/) do
  @myBookingsPage.check_all_past_booking_biscuits
end

Then(/^I should see Browse Holiday collection biscuit$/) do
  @myBookingsPage.check_browse_holiday_biscuit
end

When(/^I should see title and subtitle on add booking page$/) do
  @myBookingsPage.verify_add_booking_title_subtitle
end

When(/^I should see find booking text on add booking page$/) do
  @myBookingsPage.add_booking_find_booking
end

When(/^I should see Help email on add booking page$/) do
  @myBookingsPage.check_add_booking_help
end

When(/^I should input fields for booking details on add booking page$/) do
  @myBookingsPage.add_booking_input_fields
end

When(/^I have entered invalid information on add booking page$/) do
  step "I select add Booking biscuit"
  step "I see add a booking screen"
end

When(/^I submit wrong form details on add booking page$/) do
  sleep 2
  @firstname="firstname"
  @lastname="lastname"
  @bookingref="12345678"

  if $g_ios
    step 'I enter "'+@firstname+'" into input field number 1'
    step 'I enter "'+@lastname+'" into input field number 2'
    step 'I enter "'+@bookingref+'" into input field number 3'
    touch "toolbarTextButton index:1"
    sleep 1
    touch "toolbarTextButton index:3"
    sleep 2
  else
    fail "TODO"
  end
  @page.click_on_text @page.get_val "new_user_registration_register"
end

Then(/^I should see an Error messages displayed on add booking page$/) do
  @myBookingsPage.add_booking_failed
end

When(/^I should see any inline error messages on add booking page$/) do
  @page.assert_text_present "Der von Ihnen eingegebene Vorgang/Buchungscode konnte nicht gefunden werden. Bitte \u00FCberpr\u00FCfen Sie Ihre Eingaben."
end

Then(/^I see close button on change email page$/) do
  @page.assert_wait_for_acc @page.get_val "close_button_acc"
end

Then(/^I verify elements on change email page$/) do
  @myAccountPage.verify_change_email_page
end

Given(/^I am on change email page$/) do
  step "I have accessed my Personal Details page"
  step "I select change email from my personal details page"
end

When(/^I select change password CTA on change email page$/) do
  @page.click_on_text @page.get_val "update_email_forgot_password"
end

When(/^I see username or email prefilled on change email page$/) do
  @myAccountPage.change_password_prefilled_username
end

When(/^I tap on Browse holidays banner$/) do
  @myAccountPage.click_browse_holidays
end

Then(/^I should see Browse holidays page displayed$/) do
  @myAccountPage.verify_browse_holidays
end