Then(/^I see list of destinations on destination info page$/) do
  @destinationInfo.verify_destination_info_screen
  @destinationInfo.verify_list_of_destinations
end

Then(/^I check destination page for each destination$/) do
  @destinationInfo.check_each_destination
end

When(/^I verify destination information page$/) do
  @destinationInfo.verify_destination_screen
end