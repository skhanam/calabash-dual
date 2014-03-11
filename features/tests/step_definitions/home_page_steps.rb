Then (/^I must be on Home page$/) do
  @homePage.wait_for_home_page_to_load
  @homePage.check_i_am_on_home_page
end

# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

Then (/^I navigate to weather page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_weather_page
end

When (/^I navigate to weather page using weather biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_weather_biscuit
end

When(/^I navigate to hotel (\d+) page using side menu$/) do |num|
  @hotel_num=num.to_i
  @homePage.open_side_panel
  @sidePanel.navigate_to_hotel(num)
end

# ----------------------------------------------------------------------------------------------------------------------

#Count down step definitions

Then (/^I navigate to countdown page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_countdown_page
end

When (/^I navigate to countdown page using countdown biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_countdown_biscuit
end


# ----------------------------------------------------------------------------------------------------------------------

#booking summary page down step definitions
When (/^I navigate to booking summary page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_booking_summary_page
end


When (/^I navigate to booking summary page using booking summary biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_booking_summary_biscuit
end

When(/^I navigate to my bookings page$/) do
  @homePage.click_on_account_button
  sleep 5
end


Given(/^I am on contact us screen$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @sidePanel.navigate_to_contact_us_page
end

# ----------------------------------------------------------------------------------------------------------------------
Given(/^I navigate to terms page from side panel$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @sidePanel.navigate_to_TandC_page
end

Given(/^I have switched to (.*?) booking$/) do |booking_type|
  case booking_type
    when "typical"
      $g_current_booking=TYPICAL_BOOKING
    when "insurance"
      $g_current_booking=TYPICAL_BOOKING
    when "flight"
      $g_current_booking=FLIGHT_BOOKING
    when "single"
      $g_current_booking=FLIGHT_BOOKING
    when "non eu"
      $g_current_booking=NON_EU_BOOKING
  end

  #If required booking is already selected then do switch accounts again
  if booking_type!=$selected_booking
    $selected_booking=booking_type
    step "I am on Home screen"
    @homePage.click_on_account_button
    @myBookingsPage.switch_to_particular_booking
  else
    puts "already switched to #{booking_type} "
  end
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

When(/^I open side panel$/) do
  @homePage.open_side_panel
end

Given(/^I navigate to curreny converter page from home screen$/) do
  @homePage.navigate_to_currency_conv_page
end

When(/^I navigate to hotel (\d+) from home page$/) do |arg|
  hotel_details=@hotelPage.find_hotel_details(arg)
  hotel_name=hotel_details["name"]
  @page.scroll_page_and_assert_text(hotel_name)
  @page.click_on_text(hotel_name)
end

When(/^I navigate to destination using home page biscuit$/) do
  @countries= @commonMethods.get_desination_countries
  @dest_country=@countries[0]
  @page.scroll_page_and_assert_text(@dest_country)
  @page.click_on_text(@dest_country)
end

Then(/^I see destination information page$/) do
  @destInfoPage.check_dest_info_screen_title
  @page.assert_wait_for_text @dest_country
end

Given(/^I navigate to insurance page from home$/) do
  @homePage.navigate_to_insurance
end

Then(/^I see insurance page$/) do
  @insurancePage.check_insurance_title
end

Given(/^I navigate to my tour guide page from side panel$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @sidePanel.navigate_to_my_tour_guide
end

Given(/^I navigate to my tour guide page from home page$/) do
  @homePage.navigate_my_tour_guide
end
