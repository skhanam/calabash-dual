Then (/^I must be on Home page$/) do
  @homePage.wait_for_home_page_to_load
  @homePage.check_i_am_on_home_page
end

# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

Then (/^I navigate to weather page using side menu$/) do
  @homePage.open_side_panel
  @homePage.navigate_to_weather_page
end

When (/^I navigate to weather page using weather biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_weather_biscuit
end

When(/^I navigate to hotel (\d+) page using side menu$/) do |num|
  @hotel_num=num.to_i
  @homePage.open_side_panel
  @homePage.navigate_to_hotel(num)
end

# ----------------------------------------------------------------------------------------------------------------------

#Count down step definitions

Then (/^I navigate to countdown page using side menu$/) do
  @homePage.open_side_panel
  @homePage.navigate_to_countdown_page
end

When (/^I navigate to countdown page using countdown biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_countdown_biscuit
end



# ----------------------------------------------------------------------------------------------------------------------

#booking summary page down step definitions
When (/^I navigate to booking summary page using side menu$/) do
  @homePage.open_side_panel
  @homePage.navigate_to_booking_summary_page
end


When (/^I navigate to booking summary page using booking summary biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_booking_summary_biscuit
end

When(/^I navigate to my bookings page$/) do
  @homePage.click_on_account_button
  sleep 5
end


Given(/^I navigate to meet representative page from side panel$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @homePage.navigate_to_meet_rep_page
end


Given(/^I am on contact us screen$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @homePage.navigate_to_contact_us_page
end

# ----------------------------------------------------------------------------------------------------------------------
Given(/^I navigate to terms page from side panel$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @homePage.navigate_to_TandC_page
end

Given(/^I have switched to typical booking$/) do
  step "I am on Home screen"
  @homePage.click_on_account_button
  @myBookingsPage.switch_to_typical_booking
end

Then(/^I verify appropriate welcome message for booking$/) do
  @homePage.check_welcome_messages
end

Then(/^I must be logged and on Home page$/) do
  @homePage.wait_login_progress_to_disappear
  @homePage.wait_for_home_page_to_load
  @homePage.check_i_am_on_home_page
end

Given(/^I have opened side menu$/) do
  @homePage.open_side_panel
end
