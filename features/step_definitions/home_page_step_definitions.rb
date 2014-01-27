Then (/^I must be on Home page$/) do
  @page.check_i_am_on_home_page
end


# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

Then (/^I navigate to weather page using side menu$/) do
  @page.open_side_panel
  @page=@page.navigate_to_weather_page
end

When (/^I navigate to weather page using weather biscuit$/) do
  @page.check_i_am_on_home_screen
  @page.click_weather_biscuit
  @page=@weatherPage
end

# ----------------------------------------------------------------------------------------------------------------------

#Count down step definitions

Then (/^I navigate to countdown page using side menu$/) do
  @page.open_side_panel
  @page=@page.navigate_to_countdown_page
end

When (/^I navigate to countdown page using countdown biscuit$/) do
  @page.check_i_am_on_home_screen
  @page.click_countdown_biscuit
  @page=@holidayCountDownPage
end

# ----------------------------------------------------------------------------------------------------------------------

#booking summary page down step definitions
When (/^I navigate to booking summary page using side menu$/) do
  @page.open_side_panel
  @page=@page.navigate_to_booking_summary_page
end


When (/^I navigate to booking summary page using booking summary biscuit$/) do
  @page.check_i_am_on_home_screen
  @page.click_booking_summary_biscuit
  @page=@bookingSummaryPage
end

When(/^I navigate to my bookings page$/) do
  @page.click_on_account_button
  sleep 5
  @page=@myBookingsPage
end

