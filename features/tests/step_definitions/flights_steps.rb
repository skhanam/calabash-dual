Then(/^I should see one or more flights listed vertically$/) do
  @flightsPage.check_flights_page
end

And(/^I should see the origin to destination place name$/) do
  @flightsPage.check_flights_page
end

And(/^I should see the departure date$/) do
  @flightsPage.check_departures_dates
end

And(/^I should see the list of passengers on each flight leg$/) do
  @flightsPage.check_passenger_names
end