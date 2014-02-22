Then(/^I see terms page is displayed correctly$/) do
  @tuiServicePage.check_tui_service_page
end

Then(/^I verify below links on terms page$/) do |table|
  values=table.raw
  values.each do |var|
    @tuiServicePage.validate_menu_items(var[0])
  end
end