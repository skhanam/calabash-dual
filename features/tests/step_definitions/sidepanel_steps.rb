# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

When(/^I navigate back to home page from countdown page$/) do
  @page.click_back_button
end

When(/^I see holiday countdown page$/) do
  @countDownPage.check_count_down_page
end

# ----------------------------------------------------------------------------------------------------------------------
# count down page step definitions

When(/^I navigate back to home page from weather page$/) do
  sleep 1
  @page.click_back_button
end

When(/^I see holiday weather page$/) do
  @weatherPage.check_weather_page
end

# ----------------------------------------------------------------------------------------------------------------------
# booking summary page step definitions

When(/^I navigate back to home page from booking summary page$/) do
  @page.click_back_button
end

When(/^I see tablet holiday booking summary page$/) do
  @bookingSummaryPage.verify_booking_reference_details
  @bookingSummaryPage.verify_booking_summary_details
end

When(/^I see holiday booking summary page$/) do
  @bookingSummaryPage.verify_booking_summary_page
  @bookingSummaryPage.verify_booking_reference_details
  @bookingSummaryPage.verify_days_to_go
end

When(/^I see and verify holiday booking summary page$/) do
  @bookingSummaryPage.verify_booking_reference_details
  @bookingSummaryPage.verify_days_to_go
  @bookingSummaryPage.verify_booking_summary_details
end

Then(/^I should see a list of products in my booking$/) do
  @sidePanel.verify_elements_for_typical_booking
end

Given(/^I navigate to flights page from side panel$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_flights_page
end

Then(/^I see app feedback page$/) do
  @appFeedbackPage.check_app_feedback_title  if $g_phone # this is not present for tablet
  @appFeedbackPage.verify_app_feedback_page
end

Then(/^I must see below items:$/) do |table|

end

Then(/^I must see below items on sidepanel for booking:$/) do |table|
  values=table.raw
  values.each do |var|
    @sidePanel.validate_typical_booking_menu_items(var[0])
  end
end

When(/^I navigate to insurance page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_insurance_page
end

Then(/^I should see a list of products in booking$/) do
  @sidePanel.verify_side_panel_strings
end

Then(/^I navigate to each item and navigate back to home screen$/) do |table|
  values=table.raw
  values.each do |var|

    #skip the iteration if weather is not retrieved
    if (var[0]=="Weather" && @page.check_text_in_view(@page.get_localized_string("weather_coming_soon"))) == true
      puts "weather info not available coming soon"
      next
    end

    @homePage.open_side_panel
    sleep 2
    @sidePanel.navigate_from_side_menu(var[0])
    sleep 2

    if ENV['TAKE_SS']=="yes"
      sleep 5
      screenshot(options={:name => "#{var[0]}"})
    end

    @page.navigate_back
    sleep 2
    @homePage.check_home_screen
    sleep 2
  end
end

When(/^I navigate to destination using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu("destination")
end

When(/^I navigate to Taxfree page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu("Duty Free")
end


When(/^I navigate to excursion page from side panel$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu("Excursions")
end

When(/^I navigate to feedback page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu("App Feedback")
end

When(/^I navigate to contact us page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu("Contact us")
end

When(/^I click on Logout using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_from_side_menu("Log out")
end

When(/^I confirm Logout$/) do
  @sidePanel.confirm_logout
end

Then(/^I should navigate to welcome screen$/) do
  sleep 5
  fail("Welcome page not found") if (@welcomePage.check_welcome_screen != true)
end

Then(/^I should see one menu entry per destination$/) do
  @sidePanel.check_destinations(@bookings)
end

When(/^I should see the destination name on the menu$/) do
  @sidePanel.check_destinations(@bookings)
end