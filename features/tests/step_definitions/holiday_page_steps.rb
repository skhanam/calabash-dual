Given(/^I am on the browse\-a\-holiday page$/) do
  step "I am on Home screen"
  @homePage.open_side_panel
  @sidePanel.validate_typical_booking_menu_items ("Browse our holiday collections")
  @holidayMosaicPage.click_browse_our_holiday_collections
end

When(/^I  tap on a mosaic item$/) do
end