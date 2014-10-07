
Given(/^I submit credentials with wrong country selected/) do
  uname=$g_user_details[:username]
  pwd=$g_user_details[:password]
  country="Schweiz"

  step "I am on 'Login' screen"
  step "I log into the App using #{uname}, #{pwd} and #{country}" if ($g_current_app=='DE_MT')

  sleep 2
  step "I select the Login text"
  end

Given(/^I have entered an invalid email and a valid password$/) do
  step "I am on 'Login' screen"
  @uname=$g_invalid_user_details[:email]
  @pwd=$g_valid_user_details[:password]
  @country=$g_valid_user_details[:country]
  step "I log into the App using #{@uname}, #{@pwd} and #{@country}"
end


When(/^should observe that values entered are retained$/) do
  @page.assert_wait_for_text @uname
  @page.assert_wait_for_text @country
end

Then(/^I see alternative country options for submitted credentials$/) do
  @wrongCountryPage.check_wrong_country_screen
end

When(/^I see new user registration section$/) do
  @wrongCountryPage.new_user_reg_screen
end

When(/^I select correct country and resubmit details$/) do
  @loginPage.setCountry($g_user_details[:country])
  @wrongCountryPage.submit_country_details
  end

When(/^I should see Heading - Login$/) do
  @loginPage.check_login_title
end

When(/^I should see Login button$/) do
  @loginPage.check_login_button
end

When(/^I should see Forgot CTA$/) do
  @loginPage.check_forgot_link
end

When(/^I should see Register CTA$/) do
  @loginPage.check_register_link
end

When(/^I should see I need help CTA$/) do
  @loginPage.check_need_help_link
end

When(/^I should see Username \/ Password \/ Country - Pre populated with text$/) do
  @loginPage.check_hint_text
end

When(/^I should see Username \/ Password \/ Country - with 'i' button$/) do
  @loginPage.check_info_button
end

When(/^I submit wrong login credentials$/) do
  step 'I have entered an invalid email and a valid password'
  step 'I submit Login details'
end

Given(/^I accessed the Register page modal$/) do
 step "I am on 'Login' screen"
  @loginPage.select_register_button
end

When(/^I should sub-title and sub title for register page$/) do
  @registrationPage.check_title_subtitle
end

When(/^I should see input fields for booking details$/) do
  @registrationPage.check_booking_details
end

When(/^I should see input fields for account details$/) do
  @registrationPage.check_login_details
end

Then(/^I see below items on Register page$/) do |table|
  values=table.raw
  values.each do |var|
    @registrationPage.validate_text(var[0])
  end
end