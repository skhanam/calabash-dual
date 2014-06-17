Then(/^I see Taxfree page$/) do
  @dutyFreePage.check_duty_free_page
end

When(/^I select links on Taxfree screen$/) do
  @dutyFreePage.click_tax_free_link
end
Then(/^I see webview for Taxfree being displayed$/) do
  @dutyFreePage.check_webview
end