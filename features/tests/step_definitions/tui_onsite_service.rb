And(/^I select hotel from TUI service onsite page$/) do
  @tuiServicePage.tui_service_select_hotel
end

Then(/^I see TUI service onsite page$/) do
  @tuiServicePage.check_tui_service_page
end

Then(/^I see TUI contact page$/) do
  @tuiServicePage.check_tui_contact_page
end

When(/^I select TUI service contact page$/) do
  @tuiServicePage.navigate_to_contact_screen
end