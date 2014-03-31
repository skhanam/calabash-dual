Given(/^I log into the App using (.*?), (.*?) and (\w+)/) do |username, password, country|
   meine_tui_login(username, password, country)
end

def thomson_login(username, password, country)
  if $g_ios
    step 'I enter "'+username+'" into input field number 1'
  end
  @loginPage.login_thomson
end

def meine_tui_login(username, password, country)
  puts "#{username}, #{password}, #{country}"
  if $g_ios
    step 'I enter "'+username+'" into input field number 1'
    step "I touch done"
    step 'I enter "'+password+'" into input field number 2'
    step "I touch done"
  elsif $g_android
    step 'I enter "'+username+'" into input field number 2'
    step 'I enter "'+password+'" into input field number 3'
    step "I press the enter button"
  end
  step "I set country #{country} in login screen"
  sleep 2
end

Given(/^I log into Application/) do
  uname=$g_user_details[:username]
  pwd=$g_user_details[:password]
  country=$g_user_details[:country]

  step "I log into the App using #{uname}, #{pwd} and #{country}" if (ENV['TESTENV']=='DE_MT')
  step "I log into thomson application" if (ENV['TESTENV']=='EN_TH')
  step "click on login button"

end


Given(/^I log into thomson application$/) do
  step "I am on 'Login' screen"

  surname=THOMSON_USER[:valid][:surname]
  departureDate=THOMSON_USER[:valid][:departuredate]
  visionShopNumber=THOMSON_USER[:valid][:VisionShopNumber]
  visionBookingRef=THOMSON_USER[:valid][:VisionBookingRef]
  @loginPage.login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)

end

Given(/^I have entered an invalid email and a valid password$/) do
  uname=$g_invalid_user_details[:email]
  pwd=$g_valid_user_details[:password]
  country=$g_valid_user_details[:country]
  step "I log into the App using #{uname}, #{pwd} and #{country}"
end

Given(/^I am on '(.+)' screen/) do |page_name|
  case page_name
    when 'Login' then
      @welcomePage.navigate_to_login
    when 'Welcome' then
      @welcomePage.verify_welcome_screen
    else
      fail("page not found")
  end
end

Given(/I am on welcome page$/) do
  step 'I see welcome page'
end

When(/^I set country (\w+) in login screen$/) do |var|
  @loginPage.setCountry(var)
end


When(/^I enter "(.*?)" and "(.*?)" in login page$/) do |username, password|
  @loginPage.enter_credentials(username, password)
end

When(/^I enter default username and password in login page$/) do
  @loginPage.enter_default_username_password
end

When(/^click on login button$/) do
  @loginPage.submit_login_button
end


Then(/^I see login Page/) do
  @loginPage.verify_login_page
end
Then(/^I see login screen$/) do
  @loginPage.check_login_screen
end

When(/^I fill (valid|invalid) username in login screen$/) do |condition|
  #@valid_username=@loginPage.enter_valid_user_name if condition.eql? 'valid'
  if condition.eql? 'valid'
    @valid_username = $g_valid_user_details[:username]
    step 'I enter "'+@valid_username+'" into input field number 1' if $g_ios
    step 'I enter "'+@valid_username+'" into input field number 2' if $g_android

    step "I touch done" if $g_ios
    step "I press the enter button" if $g_android
    sleep 1
  end

end

Then(/^I see my username is already populated$/) do
  @forgotPasswordPage.check_email_populated(@valid_username)
end

When(/^I navigate to forgot password screen$/) do
  sleep 2
  @loginPage.navigate_to_forgot_password
end


Then(/^I see my username is empty$/) do
  @forgotPasswordPage.check_email_field_empty
end

And(/^submit an (valid|invalid) email id in forgot password screen$/) do |condition|

  if condition.eql? 'invalid'
    @invalid_username = USERS[:invalid][:email]
    step 'I enter "'+@invalid_username+'" into input field number 1' if $g_ios
    step 'I enter "'+@invalid_username+'" into input field number 2' if $g_android

    step "I touch done" if $g_ios
    step "I press the enter button" if $g_android
    sleep 1
  end
  #@forgotPasswordPage.enter_wrong_username_or_email if condition.eql? 'invalid'
  fail 'TODO' if condition.eql? 'valid'
  @forgotPasswordPage.submit_change_password
end

Then(/^I see appropriate error message$/) do
  @forgotPasswordPage.check_wrong_username_email
end

When(/^I select the Login button$/) do
  @loginPage.submit_login_button
end

Then(/^I see appropriate username error message$/) do
  @loginPage.check_username_pwd_error
end

Given(/^I have entered an valid email and invalid password$/) do
  uname=$g_valid_user_details[:email]
  pwd=$g_invalid_user_details[:password]
  country=$g_valid_user_details[:country]
  step "I log into the App using #{uname}, #{pwd} and #{country}"
end

Then(/^I see appropriate password error message$/) do
  @loginPage.check_username_pwd_error
end

