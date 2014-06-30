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

#Verify all flights listed on flights landing page
Then(/^I see flights page with my flights listed$/) do
  @flightsPage.check_flights_listing
end

Then(/^I verify details of all flights$/) do
  count=CommonMethods.new.find_number_of_flights
  @flightsPage.check_flights_listing
  if count>1
    @flightsPage.check_details_of_flight
  end
end

Then(/^I should not see flights list$/) do
  count=CommonMethods.new.find_number_of_flights
  puts "count #{count}"
  @flightsPage.check_flights_list_is_not_shown
end

Then(/^I should see list of all the flights in my journey$/) do
  pending
end