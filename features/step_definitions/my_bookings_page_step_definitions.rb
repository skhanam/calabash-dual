Then(/^I see my bookings page$/) do
  @page.check_my_bookings_page
end

And(/^read my bookings into user details$/) do
  @page.fill_user_details
end

When(/^I click on edit account button from my bookings page$/) do
  @page.navigate_to_account_details
  @page=MyAccountPage.new
end


When(/^I click on booking in past$/) do
  @booking_in_past_message=@page.click_booking_in_past
  @page=HomePage.new
end

Then(/^I see welcome message for booking in past on home screen$/) do
  step "I am on Home screen"
  @page.check_booking_in_past_message(@booking_in_past_message)
end