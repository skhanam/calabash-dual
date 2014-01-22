Then(/^I see my account page$/) do
  @page.check_my_account_page
end

When(/^I click on change password button from my account page$/) do
  @page.click_change_password_button
end

Then(/^I see change password page$/) do
  @page.check_change_password_page
end
