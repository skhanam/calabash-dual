# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

When(/^I navigate back to home page from countdown page$/) do
  @page.click_back_button
  @page=HomePage.new
end


When(/^I see holiday countdown page and navigate back to home screen$/) do
  @page.check_count_down_page
  step "I navigate back to home page from countdown page"
end


# ----------------------------------------------------------------------------------------------------------------------
# count down page step definitions

When(/^I navigate back to home page from weather page$/) do
  @page.click_back_button
  @page=HomePage.new
end


When(/^I see holiday weather page and navigate back to home screen$/) do
  @page.check_weather_page
  step "I navigate back to home page from weather page"
end

