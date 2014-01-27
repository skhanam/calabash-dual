Then(/^I see my account page$/) do
  @page.check_my_account_page
end

Then(/^I see my account screen/) do
  @page.check_my_account_screen
end

When(/^I select update email from my account page$/) do
  @page.click_update_email_button
end

Then(/^I see update email page$/) do
  @page.check_update_email_page
end

Given(/^I am on my account page$/) do
  step "I am on my bookings page"
  step "I click on edit account button from my bookings page"
  step "I see my account screen"

end

When(/^I select change password from my account page$/) do
  @page.click_change_password_button
end

Then(/^I see change password page$/) do
  @page.check_change_password_page
end


And(/^verify my details on account page$/) do
  step "I see my account page"
  @page.verify_my_details
end

When(/^I log out from application$/) do
  @page.logout_from_app
  @page=@welcomePage
end