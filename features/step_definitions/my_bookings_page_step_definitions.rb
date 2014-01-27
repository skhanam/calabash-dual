Then(/^I see my bookings page$/) do
  @page.check_my_bookings_page
end

And(/^read my bookings into user details$/) do
  @page.fill_user_details
end

When(/^I click on edit account button from my bookings page$/) do
  @page.navigate_to_account_details
  @page=@myAccountPage
end


When(/^I select a booking in past$/) do
  @booking_in_past_message=@page.click_booking_in_past
  @page=@homePage
end

Then(/^I see welcome message for booking in past on home screen$/) do
  step "I am on Home screen"
  @page.check_booking_in_past_message(@booking_in_past_message)
end

Given(/^I am on my bookings page$/) do
  step "I am on Home screen"
  step "I navigate to my bookings page"
  step "I see my bookings page"
end

When(/^I select add a booking button$/) do
  @page.click_add_a_booking_button
end

Then(/^I see add a booking page$/) do
  @page.check_add_booking_page
end