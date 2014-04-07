Then(/^I see my account page$/) do
  @myAccountPage.check_my_account_page
end

Then(/^I see my account screen/) do
  @myAccountPage.check_my_account_screen_title
end

When(/^I select update email from my account page$/) do
  step "I am on my account page"
  @myAccountPage.click_update_email_button
end

Then(/^I see update email page$/) do
  @myAccountPage.check_update_email_page
end

Given(/^I am on my account page$/) do
  step "I am on my bookings page"
  step "I click on edit account button from my bookings page"
  step "I see my account screen"

end

When(/^I select change password from my account page$/) do
  @myAccountPage.click_change_password_button
end

Then(/^I see change password page$/) do
  @myAccountPage.check_change_password_page
end


And(/^verify my details on account page$/) do
  step "I see my account page"
  @myAccountPage.verify_my_details
end

When(/^I log out from application$/) do
  if ($g_current_app=='DE_MT')
    step "I am on my account page"
    @myAccountPage.logout_from_app
  elsif ($g_current_app=='EN_TH')
    step "I am on Home screen"
    @homePage.logout_from_home_screen
  end

end


Given(/^I choose to change password from my account page$/) do
  step "I am on my account page"
  step "I select change password from my account page"

end


Then(/^I verify below details on account page:$/) do |table|
  values=table.raw
  values.each do |var|
    @myAccountPage.validate_menu_items(var[0])
  end
end
