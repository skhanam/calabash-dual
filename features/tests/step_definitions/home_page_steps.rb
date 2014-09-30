Then (/^I must be on Home page$/) do
  @homePage.wait_for_home_page_to_load
  @homePage.check_i_am_on_home_page
end
# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

Then (/^I navigate to weather page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu "Weather"
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
  @sidePanel.navigate_from_side_menu "Countdown"
end

When (/^I navigate to countdown page using countdown biscuit$/) do
  @homePage.check_home_screen
  @homePage.click_countdown_biscuit
end
# ----------------------------------------------------------------------------------------------------------------------

#booking summary page down step definitions
When (/^I navigate to booking summary page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu "Holiday summary"
end


When (/^I navigate to booking summary page using booking summary biscuit$/) do
  step "I am on Home screen"
  @homePage.click_booking_summary_biscuit
end

When(/^I navigate to my bookings page$/) do
  @homePage.navigate_to_account
  sleep 5
end


Given(/^I am on contact us screen$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu "Contact us"
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
      $g_current_booking=$g_typical_booking_data
    when "insurance"
      $g_current_booking=$g_typical_booking_data
    when "flight"
      $g_current_booking=$g_flight_booking_data
    when "single"
      $g_current_booking=$g_flight_booking_data
    when "non eu"
      $g_current_booking=$g_non_eu_booking_data
    when "one way"
      $g_current_booking=$single_journey_multi_leg
  end

  $g_booking.set_payload($g_current_booking["payload"])

  step "I am on Home screen"

  #If required booking is already selected then do switch accounts again
  #TODO remove if false
  p "********************** this code must be removed later **********************"
  if false
    if booking_type!=$selected_booking
      $selected_booking=booking_type
      @homePage.navigate_to_account
      @myBookingsPage.switch_to_particular_booking
    else
      puts "already switched to #{booking_type} "
    end
  end

end

Then(/^I verify appropriate welcome message for booking$/) do
  @homePage.check_welcome_messages
end

Then(/^I must be logged in and on Home page$/) do
  #TODO optimize below code
  acc_label="background_normal" if $g_phone
  acc_label="countdown_Biscuit" if $g_tablet

  @homePage.assert_wait_for_acc("#{acc_label}",20)
  sleep 5
  screenshot(options={:name => "home"}) if ENV['TAKE_SS']=="yes"
end

Given(/^I have opened side menu$/) do
  @homePage.open_side_panel
end

When(/^I open side panel$/) do
  @homePage.open_side_panel
end

Given(/^I navigate to travel money page from home screen$/) do
  @homePage.navigate_to_currency_conv_page
  @travelMoneyPage.verify_travel_money_page
end

When(/^I navigate to hotel (\d+) from home page$/) do |arg|

  hotel_details=$g_booking.find_hotel_details(arg)
  hotel_name=hotel_details["name"]
  @page.scroll_page_and_assert_text(hotel_name)
  @page.click_on_text(hotel_name)


end

When(/^I navigate to destination using home page biscuit$/) do
  @countries= $g_booking.get_destination_countries
  @dest_country=@countries[0]
  @page.scroll_home_biscuits(@dest_country)
  @page.click_on_text(@dest_country)
end

Then(/^I see destination information page$/) do
  @destinationInfo.check_dest_info_screen_title
  @countries= $g_booking.get_destination_countries
  @dest_country=@countries[0]
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


Given(/^I am check list page$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @homePage.navigate_to_check_list
end

Given(/^I am on packaging list page$/) do
  step "I am on Home screen"
  step "I am check list page"
  step "I open my packaging list"
end

Given(/^I am on weather page$/) do
  @homePage.check_home_screen
  @homePage.click_weather_biscuit
end

Given(/^I am on default booking$/) do
  step "I have switched to typical booking" if $g_german_app
end

Given(/^I am on home screen with one way booking$/) do
  step "I am on Home screen"
  step "I have switched to one way booking" if $g_german_app
end

Given(/^I am on home screen with default booking$/) do
  step "I am on Home screen"
  step "I am on default booking"
end

When(/^I navigate to App feedback page$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu "App Feedback"
end

Given(/^I am on home screen with single booking$/) do
  step "I am on Home screen"
  step "I have switched to single booking" if $g_german_app
end

Then(/^I verify taxfree biscuit on home page$/) do
  @homePage.check_taxfree_biscuit
end

When(/^I select booking summary biscuit on home page$/) do
  @homePage.select_booking_summary_biscuit
end

When(/^I select guide online biscuit on home page$/) do
  @homePage.select_guide_online
end

Then(/^I see guide online page$/) do
  @guideOnlinePage.verify_guide_online_screen
end

When(/^I select destination biscuit$/) do
  @homePage.select_destination_biscuit
end

Then(/^I verify booking summary page$/) do
  @bookingSummaryPage.verify_booking_reference_number
  @bookingSummaryPage.verify_days_to_go
  @bookingSummaryPage.verify_booking_summary_details
end

Then(/^I see the Welcome back pop-over$/) do
  @homePage.check_post_holiday_popup_window
end


When(/^I tap on Post Holiday OK button$/) do
  @postLoginHomeBasePage.click_ok_on_popup
end

Then(/^I should be navigated to Post Holiday page$/) do
  @postLoginHomeBasePage.check_post_login_page
end

Then(/^I should see a Countdown biscuit with a count of days left$/) do
  @page.assert_wait_for_text @countdown.to_s
  @homePage.check_countdown_biscuit
end

And(/^Then I should navigated to Post Holiday page and see all information$/) do
  step "I tap on Post Holiday OK button"
  @postLoginHomeBasePage.check_post_login_page
end

Given(/^I have more than one day left for my holiday$/) do
  step 'I am on home screen with default booking'
  @countdown=$g_booking.get_countdown_days
end

When(/^I select countdown biscuit$/) do
  step "I navigate to countdown page using countdown biscuit"
end


When(/^I access the Holiday Countdown page$/) do
  step "I navigate to countdown page using side menu"
end


Then(/^I must see welcome back message$/) do
  @postLoginHomeBasePage.check_post_login_screen
end
When(/^I should see relevant content on post holiday popup$/) do
  @homePage.check_post_holiday_popup_window_content

end
Given(/^I am on Home screen with pre holiday booking$/) do
  step "I am on home screen with default booking"
end

Then(/^I should see a Weather Biscuit appear$/) do
  @homePage.weather_biscuit_present?
end

When(/^I should see Weather type icon$/) do
  @homePage.assert_wait_for_text "°c"
  #check weather is a number
  @homePage.check_temp_present

end

When(/^I should see country name$/) do
  @homePage.country_name_shown_weather_biscuit?
end

Given(/^I am on Home screen with multi destination booking$/) do
  step "I am on Home screen"
  step "I am on default booking"
end

When(/^I should see Weather Biscuit display weather for each destination in a loop of 5s$/) do
  fail("This isnt multi destination booking") if $g_booking.get_country_names_for_weather.count <=1
  @homePage.country_name_shown_weather_biscuit?
end

Then(/^I should see a "([^"]*)" biscuit on home page$/) do |arg|
  @homePage.scroll_to_biscuit arg

end
When(/^I tap on the checklist biscuit on home page$/) do
  step "I should see a \"checklist\" biscuit on home page"
  @homePage.click_accessibility_label "checklist_Biscuit"
end

Then(/^I should be navigated to Checklist page$/) do
  @checklistPage.verify_checklist_page
end