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
  @bookingSummaryPage.check_booking_summary_page
end


Then(/^I should see a list of products in my booking$/) do
  @sidePanel.verify_elements_for_typical_booking
end


Given(/^I navigate to flights page from side panel$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_flights_page
end

Then(/^I must see below items:$/) do |table|

end

Then(/^I must see below items on sidepanel for booking:$/) do |table|
  values=table.raw
  values.each do |var|
    @sidePanel.validate_typical_booking_menu_items(var[0])
  end
end