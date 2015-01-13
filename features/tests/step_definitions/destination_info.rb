Then(/^I see list of destinations on phone destination info page$/) do
  @destinationInfo.verify_destination_info_screen
  @destinationInfo.verify_list_of_destinations
end

Then(/^I check destination page for each destination$/) do
  @destinationInfo.check_each_destination
end

When(/^I see destination information page$/) do
  @destinationInfo.verify_destination_page
end

Then(/^I see list of destinations in sidepanel in meine TUI$/) do
  @homePage.open_side_panel
  sleep 1
  $g_booking.get_destination_countries.each {
      |val|
    puts val
    @sidePanel.verify_sidepanel_entries val
  }
end

Then(/^I see appropriate destination page$/) do
  sleep 1
  $g_booking.get_destination_countries.each {
      |val|
    @page.assert_wait_for_text val
  }
end

When(/^I navigate to destination using destination biscuit$/) do
 step 'I navigate to first destination using home page biscuit'
end