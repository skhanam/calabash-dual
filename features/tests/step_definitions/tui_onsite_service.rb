And(/^I select hotel from TUI service onsite page$/) do
  @tuiServicePage.tui_service_select_hotel
end

Then(/^I see TUI service onsite page$/) do
  @tuiServicePage.check_tui_service_page
end