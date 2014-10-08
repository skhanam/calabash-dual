Then(/^I see my account page$/) do
  @myAccountPage.check_my_account_page
end

Then(/^I see my account screen/) do
  @myAccountPage.check_my_account_screen_title
end

When(/^I select change email from my personal details page$/) do
   @myAccountPage.click_change_email_button
end

Given(/^I have accessed my Personal Details page$/) do
  step "I am on my account page"
end

Given(/^I am on my account page$/) do
   step "I am on my bookings page"
   step "I click on edit account button from my bookings page" if $g_phone
   step "I see my account screen"
end

Given(/^I choose to change password from my account page$/) do
   step "I select change password from my account page"
end

Then(/^I see change password page$/) do
  @myAccountPage.check_change_password_page
end

When(/^I select change password from my account page$/) do
  @myAccountPage.click_change_password_button
end

And(/^verify my details on account page$/) do
  step "I see my account page"
  @myAccountPage.verify_my_details
end

When(/^I log out from application$/) do
  #puts "LANGUAGE SPECIFIED #{$g_current_app}"
  if ($g_current_app=='DE_MT')
    step "I am on my account page"
    @myAccountPage.logout_from_app
  elsif ($g_current_app=='EN_TH' ||$g_current_app=='EN_FC' || $g_nordics_app)
    step "I am on Home screen"
    @homePage.logout_from_home_screen
  else
  fail("LANGUAGE HAS TO BE SPECIFIED #{$g_current_app}")
  end
end

Then(/^I verify below details on account page:$/) do |table|
  values=table.raw
  values.each do |var|
    @myAccountPage.validate_menu_items(var[0])
  end
end

When(/^I see add booking biscuit$/) do
  @myBookingsPage.check_add_booking_screen
end

When(/^I tap on Logout$/) do
  @myAccountPage.click_on_logout_button
end

Then(/^I should see logout OS dialogue displayed$/) do
  @myAccountPage.verify_logout_popup
end

When(/^I tap on Add Booking biscuit$/) do
  @myBookingsPage.click_add_booking_biscuit
end

Then(/^I should see Add Booking form displayed$/) do
  @myBookingsPage.check_add_booking_page_tablet
end

When(/^I tap on any booking biscuit$/) do
@myAccountPage.click_booking_biscuit
end

Then(/^I should observe that the app homepage view has the selected booking loaded$/) do
   @homePage.click_weather_biscuit
   @myAccountPage.verify_booking_biscuit_loaded
end
When(/^I select add Booking biscuit$/) do
  @myAccountPage.select_add_booking
end