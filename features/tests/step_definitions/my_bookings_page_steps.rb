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