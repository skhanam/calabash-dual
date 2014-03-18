Then(/^I verify below details on contact page:$/) do |table|
  values=table.raw
  values.each do |var|
    @contactPage.validate_contact_items(var[0])
  end
end

And(/^contact page is displayed with necessary information$/) do
  @contactPage.check_contact_us_page
end


And(/^I navigate to terms and conditions page$/) do
  @contactPage.navigate_to_terms_and_conditions
end

Then(/^I must see terms and conditions page$/) do
  @contactPage.check_terms_and_conditions
end

And(/^I navigate to TUI service onsite page$/) do
  @homePage.open_side_panel
  @sidePanel.tui_service_onsite_from_sidepanel
end

And(/^I navigate Terms and conditions link from contact page$/) do
  @contactPage.navigate_to_terms_and_conditions
end

When(/^I select TUI service onsite link on contact us page$/) do
  @tuiServicePage.check_tui_service_screen
end