When(/^I navigate to weather page$/) do
  step "I navigate to weather page using weather biscuit"
end

And(/^I should weather forecast for five sequential days$/) do
  @weatherPage.check_weather_forecast
end

When(/^verify weather sharing text$/) do
  @weatherPage.check_weather_sharing_text
end

Then(/^I verify share icons on weather page$/) do
  @weatherPage.check_weather_page
  @weatherPage.check_weather_sharing_text
end

When(/^I see city name on weather page$/) do
  @weatherPage.check_city_name
end

When(/^I see names of next (\d+) days on weather page$/) do |arg|
  @weatherPage.check_days
end

When(/^I see min and max weather of next (\d+) days$/) do |arg|
  @weatherPage.check_min_max_temp
end