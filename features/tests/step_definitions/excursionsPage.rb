Then(/^I verify excursions page$/) do
  @excursionsPage.check_excursions_page
end

When(/^I select link for excursion$/) do
  @excursionsPage.click_excursions_link
end

Then(/^I see webview with excursions listed$/) do
  @excursionsPage.check_excursions_webview
end