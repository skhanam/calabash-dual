When(/^I navigate to good to know page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_good_to_know_page
end

Then(/^I see good to know page$/) do
  @countries= $g_booking.get_destination_countries
  @dest_country=@countries[0]
  @page.assert_wait_for_text @dest_country
  @impInfoPage.verify_good_to_know_page
end

Then(/^I see important information feedback page$/) do
  @impInfoPage.verify_good_to_know_screen
end