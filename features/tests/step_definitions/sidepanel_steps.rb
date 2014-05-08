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

When(/^I see holiday booking summary page$/) do
  @bookingSummaryPage.verify_booking_reference_number
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
  @appFeedbackPage.check_app_feedback_title
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

Then(/^I navigate to each item and navigate back to home screen$/)  do |table|
  values=table.raw
  values.each do |var|
    @homePage.open_side_panel
    sleep 2
    @sidePanel.navigate_from_side_menu(var[0])
    sleep 2
    @page.navigate_back
    sleep 2
    @homePage.check_home_screen
    sleep 2
  end
end