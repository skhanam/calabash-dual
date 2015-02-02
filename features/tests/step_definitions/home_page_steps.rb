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
  @hotel_details=$g_booking.get_hotel_details[num.to_i-1]
  @hotel_name=@hotel_details["name"]
  @homePage.open_side_panel
  @sidePanel.navigate_to_hotel(num)
end


When(/^I navigate to hotel (\d+) from home page$/) do |arg|
  @hotel_name=$g_booking.get_hotel_details[arg.to_i-1]
  @hotel_name=@hotel_details["name"]
  @page.scroll_page_and_assert_text(@hotel_name) if $g_phone
  @page.click_on_text(@hotel_name)
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
      $g_current_booking_code=$g_de_typical_booking
    when "insurance"
      $g_current_booking_code=$g_de_typical_booking
    when "flight"
      $g_current_booking_code=$g_de_single_booking
    when "single"
      $g_current_booking_code=$g_de_single_booking
    when "non eu"
      $g_current_booking=$g_non_eu_booking_data
    when "one way"
      $g_current_booking=$single_journey_multi_leg
  end

  step "I am on Home screen"

  #If required booking is already selected then do switch accounts again
  if booking_type!=$selected_booking
    $selected_booking=booking_type

    de_user_details $g_current_booking_code, booking_type
    $g_booking.set_payload($g_current_booking["payload"])

    @homePage.navigate_to_account
    @myBookingsPage.switch_to_particular_booking
  else
    puts "already switched to #{booking_type} "
  end

end

Then(/^I verify appropriate welcome message for booking$/) do
  @homePage.check_welcome_messages
end

Then(/^I must be logged in and on Home page$/) do
  @page.wait_for_spinner_to_disappear
  acc_label="background_normal" if $g_phone
  acc_label= @page.get_val("countdown_biscuit_acc") if $g_tablet
  @homePage.assert_wait_for_acc("#{acc_label}", 20) if !@page.check_acc_label acc_label
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


When(/^I navigate to first destination using home page biscuit$/) do
  @home_destination_string = $g_booking.get_destination_countries[0]
  step 'I select destination biscuit'
  @destinationInfo.verify_list_of_destinations
  sleep 1
  @page.click_on_text @home_destination_string
  sleep 1
end

Then(/^I see first destination information page$/) do
  @destinationInfo.check_dest_info_screen_title if $g_phone
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
  step "I am on home screen with default booking"
  @homePage.check_home_screen
  @homePage.click_weather_biscuit
  if $g_nordics_app && ($g_weather["payload"]["weatherStations"].count > 1)
    @city=$g_weather["payload"]["weatherStations"][0]["city"]
    @page.assert_partial_text @city
    @page.click_on_partial_text @city
  end
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
  @homePage.select_destination_biscuit @home_destination_string
end

Then(/^I verify booking summary page$/) do
  @bookingSummaryPage.verify_booking_reference_details
  @bookingSummaryPage.verify_days_to_go if !$g_eng_app # this may be present for other phone apps or else remove it
  @bookingSummaryPage.verify_booking_summary_details
end

Then(/^I see the Welcome back pop-over$/) do
  @homePage.check_post_holiday_popup_window
end


When(/^I tap on Post Holiday OK button$/) do
  @postHolidayHomepage.click_ok_on_popup
end

Then(/^I should be navigated to Post Holiday page$/) do
  @postHolidayHomepage.check_post_login_page
end

Then(/^I should see a Countdown biscuit with a count of days left$/) do
  @page.assert_wait_for_text(@countdown.to_s, 20)
  @homePage.check_countdown_biscuit
end

And(/^Then I should navigated to Post Holiday page and see all information$/) do
  step "I tap on Post Holiday OK button"
  @postHolidayHomepage.check_post_login_page
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
  @postHolidayHomepage.check_post_login_screen
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
  @homePage.assert_wait_for_text "°c" if $g_tablet
  @homePage.assert_wait_for_text "c" if $g_phone
  #check weather is a number
  @homePage.check_temp_present

end

When(/^I should see country names on weather biscuit$/) do
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

Given(/^I have a pre-holiday booking$/) do
  step "I am on home screen with default booking"
end

When(/^I swipe to the right of the screen$/) do
  @page.scroll_view("right", 0)
end

Then(/^I should see a destination image biscuit appear$/) do
  @homePage.check_destination_biscuit
end

Then(/^I should see a  destination text label name$/) do
  @destinationInfo.verify_list_of_destinations
end

When(/^I tap on the first destination Biscuit$/) do
  @countries= $g_booking.get_destination_countries
  @homePage.click_destination_biscuit(1)
end

When(/^I tap on the destination Biscuit$/) do
  @homePage.click_destination_biscuit
end

Then(/^I should be navigated to first destination page$/) do
  @destinationInfo.verify_destination_page
end

Then(/^I should be navigated to destination page$/) do
  @destinationInfo.verify_destination_page
end

Then(/^I should see a Currency Converter Biscuit appear$/) do
  @homePage.verify_currency_converter_biscuit
end

Then(/^I should see the home currency of 1 = destination currency symbol equal value$/) do
  @homePage.verify_currency_converter_exchange_names
end

Given(/^I can see the Currency Converter Biscuit$/) do
  step "I have a pre-holiday booking"
  step "I swipe to see \"Currency Biscuit\""
  step "I should see a Currency Converter Biscuit appear"
end

When(/^I tap on the Currency Converter Biscuit$/) do
  @homePage.click_currency_converter_biscuit
end

Then(/^I should be navigated to Currency Converter page$/) do
  @homePage.verify_currency_converter_page
end

When(/^I access  the application home page$/) do
  @homePage.check_home_screen
end

Then(/^I should see a Hotel Biscuit appear$/) do
  @homePage.check_hotel_biscuit
end

And(/^I should see the text label Step inside hotel name in two lines$/) do
  @homePage.verify_hotel_biscuit
end

Then(/^I swipe to see "([^"]*)" is removed$/) do |arg|
  @homePage.de_extras_biscuit_removed

end

Then(/^I swipe to see "([^"]*)"$/) do |arg|
  @homePage.scroll_to_biscuit arg
end

Then(/^I should see an Holiday extras Biscuit appear$/) do
  @holidayExtrasPage.verify_extra_biscuit
end

Given(/^I can see the Holiday extras Biscuit$/) do
  step "I have a pre-holiday booking"
  step "I swipe to see \"extras Biscuit\""
end

When(/^I tap on the Holiday extras Biscuit$/) do
  @holidayExtrasPage.click_extra_biscuit
end

Then(/^I should be navigated to Holiday extras page$/) do
  @holidayExtrasPage.verify_extras_page
end

When(/^I have multiple destinations in my booking$/) do
  @bookings=$g_booking.get_destination_countries
  fail ("This is not multi destination booking") if @bookings.count <=1
end

When(/^I select Excursions Biscuit on home page$/) do
  #TODO replace this step with  #  When I select Excursions Biscuit for second destination
  #@homePage.check_excursions_biscuit
  step "I swipe to see \"Excursions Biscuit\""
  @page.click_acc_label @page.get_val "home_page_excursions_Biscuit_acc"
end

When(/^I tap on the checklist biscuit on home page$/) do
  step "I swipe to see \"checklist Biscuit\""
  @page.click_acc_label @page.get_val "home_page_checklist_Biscuit_acc"
end

When(/^I select Excursions Biscuit for (first|second) destination$/) do |var|
  @excursion_num=1 if var=="first"
  @excursion_num=2 if var=="second"
  step "I swipe to see \"Excursions Biscuit\""
  acc_label= @page.get_val "home_page_excursions_Biscuit_acc"
  @page.click_element "view marked:'#{acc_label}' index:'#{@excursion_num.to_i-1}'"
end

When(/^I log out from post holiday screen$/) do
  @postHolidayHomepage.en_post_holiday_logout
end
When(/^I navigate to logout$/) do
  if $g_phone && $g_german_app
    step 'I have accessed my Personal Details page'
    step 'I tap on Logout'
    step 'I should see logout OS dialogue displayed'
  else
    @page.open_side_panel
    step 'I click on Logout using side menu'
  end
end

Given(/^I am on weather page with single booking$/) do
  step 'I am on home screen with single booking'
  @homePage.click_weather_biscuit
end