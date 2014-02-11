Given(/^I log into Application using "(.*?)" and "(.*?)"/) do |username, password|
  step "I am on 'Login' screen"
  step 'I enter default username and password in login page'
  step "I enter \"#{username}\" and \"#{password}\" in login page"
  step "click on login button"
end

Given(/^I log into Application/) do
  step "I am on 'Login' screen"
  step 'I enter default username and password in login page'
  step "click on login button"
  @page=@homePage
end

Given(/^I am on '(.+)' screen/) do |page_name|
  case page_name
    when 'Login' then
      @page= @welcomePage.navigate_to_login
    when 'Welcome' then
      @page=@welcomePage
      @welcomePage.verify_welcome_screen
    else
      fail("page not found")
  end
end

Given (/^I am on welcome page$/) do
  step "I am on 'Welcome' screen"
  step "I see welcome page"
end


When (/^I enter "(.*?)" and "(.*?)" in login page$/) do |username, password|
  @loginPage.enter_credentials(username, password)
end

When (/^I enter default username and password in login page$/) do
  @loginPage.enter_default_username_password
end

When (/^click on login button$/) do
  @loginPage=@page.submit_login_button
end


Then(/^I see login screen$/) do
  @loginPage.check_login_page
end

When(/^I fill (valid|invalid) username in login screen$/) do |condition|
  @valid_username=@loginPage.enter_valid_user_name if condition.eql? 'valid'

end

Then(/^I see my username is already populated$/) do
  @loginPage.check_email_populated(@valid_username)
end

When(/^I navigate to forgot password screen$/) do
  sleep 2
  @loginPage.click_forgot_password
  @page=@forgotPasswordBasePage
end


Then(/^I see my username is empty$/) do
  @page.check_email_field_empty
end

And(/^submit an (valid|invalid) email id in forgot password screen$/) do |condition|
  @page.enter_wrong_username_or_email  if condition.eql? 'invalid'
  fail 'TODO'  if condition.eql? 'valid'
  @page.submit_change_password
end

Then(/^I see appropriate error message$/) do
  @page.check_wrong_username_email
end