
Then (/^I must be on Home page$/) do
  @page.check_i_am_on_home_page
end


# ----------------------------------------------------------------------------------------------------------------------
# Weather page step definitions

Then (/^I navigate to weather page using side menu$/) do
  swipe(:right)
  sleep 1
  @page=@page.navigate_to_weather_page
end

When (/^I navigate to weather page using weather biscuit$/) do
  @page.check_i_am_on_home_screen
  @page.click_weather_biscuit
  @page=WeatherPage.new
end



# ----------------------------------------------------------------------------------------------------------------------

#Count down step definitions

Then (/^I navigate to countdown page using side menu$/) do
  swipe(:right)
  sleep 1
  @page=@page.navigate_to_countdown_page
end

When (/^I navigate to countdown page using countdown biscuit$/) do
  @page.check_i_am_on_home_screen
  @page.click_countdown_biscuit
  @page=CountDownPage.new
end

