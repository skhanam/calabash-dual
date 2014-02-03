# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

When(/^I navigate back to home page from countdown page$/) do
  @page.click_back_button
  @page=@homePage
end


When(/^I see holiday countdown page$/) do
  @page.check_count_down_page
  step "I navigate back to home page from countdown page"
end


# ----------------------------------------------------------------------------------------------------------------------
# count down page step definitions

When(/^I navigate back to home page from weather page$/) do
  sleep 1
  @page.click_back_button
  @page=@homePage
end


When(/^I see holiday weather page$/) do
  @page.check_weather_page
  step "I navigate back to home page from weather page"
end

# ----------------------------------------------------------------------------------------------------------------------
# booking summary page step definitions

When(/^I navigate back to home page from booking summary page$/) do
  @page.click_back_button
  @page=@homePage
end

When(/^I see holiday booking summary page$/) do
  @page.check_booking_summary_page
  step "I navigate back to home page from booking summary page"
end

