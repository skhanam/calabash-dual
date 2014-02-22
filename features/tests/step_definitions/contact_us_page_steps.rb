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
  @contactPage.navigate_tui_service_onsite_screen
end

Then(/^I must see TUI service onsite page$/) do
  @tuiServicePage.check_tui_service_screen
end