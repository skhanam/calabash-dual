When(/^I navigate to good to know page using side menu$/) do
  @homePage.open_side_panel
  @sidePanel.navigate_to_good_to_know_page
end

Then(/^I see good to know page$/) do
  @countries= $g_booking.get_destination_countries
  #@countries.each do |var|
  #  @page.assert_wait_for_text(var[0])
  #end
  @dest_country=@countries[0]
  @page.assert_wait_for_text @dest_country
  @goodToKnowPage.verify_good_to_know_page
end

