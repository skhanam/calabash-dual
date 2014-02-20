When(/^I navigate to weather page$/) do
  step "I navigate to weather page using weather biscuit"
end

And(/^I should weather forecast for five sequential days$/) do
  @weatherPage.check_weather_forecast
end