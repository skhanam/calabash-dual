Given(/^I log into the App using (.*?), (.*?) and (\w+)/) do |username, password, country|
  meine_tui_login(username, password, country)
end

def meine_tui_login(username, password, country)
  puts "#{username}, #{password}, #{country}"
  if $g_ios
    step "I clear input field number 1"
    step 'I enter "'+username+'" into input field number 1'
    step "I touch done"

    step "I clear input field number 2"
    step 'I enter "'+password+'" into input field number 2'
    step "I touch done"
  elsif $g_android
    step "I clear input field number 2"
    step 'I enter "'+username+'" into input field number 2'
    step "I clear input field number 3"
    step 'I enter "'+password+'" into input field number 3'
    step "I press the enter button"
  end
  step "I set country #{country} in login screen"
  sleep 2
end


def thomson_login(surname, departureDate, visionShopNumber, visionBookingRef)

  if $g_ios
    #@loginPage.login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)
    step "I clear input field number 1"
    step 'I enter "'+surname+'" into input field number 1'
    touch("toolbarTextButton index:1")
    sleep 1
    @loginPage.enter_date_ios(departureDate)
    touch("toolbarTextButton index:1")
    sleep 1
    step "I clear input field number 2"
    step 'I enter "'+visionShopNumber+'" into input field number 2'
    touch("toolbarTextButton index:1")
    sleep 1
    step "I clear input field number 3"
    step 'I enter "'+visionBookingRef+'" into input field number 3'
    touch("toolbarTextButton index:1")
    sleep(2)

  elsif $g_android
    performAction('clear_numbered_field', 2)
    performAction('clear_numbered_field', 6)
    performAction('clear_numbered_field', 8)

    touch("* marked:'surname.'")
    @page.enter_text_android(surname)

    touch("* marked:'departureDate.'")
    sleep 2
    performAction('set_date_with_index', departureDate, 1)
    sleep 2
    if element_exists "* text:'Set'"
      touch("* text:'Set'")
    elsif element_exists "* text:'Done'"
      touch("* text:'Done'")
    end
    sleep 2

    touch("* marked:'bookingReference1.'")
    sleep 1
    @page.enter_text_android(visionShopNumber)
    sleep 1

    touch("* marked:'bookingReference2.'")
    sleep 1
    @page.enter_text_android(visionBookingRef)

    @loginPage.scroll_to_end_of_page

  end
end


def nordics_login(bookingNum, email, telephone)
  #step "I clear input field number 1"
  #step 'I enter "'+bookingNum+'" into input field number 1'
  #touch("toolbarTextButton index:1")
  #sleep 1
  #step "I clear input field number 2"
  #step 'I enter "'+email+'" into input field number 2'
  #touch("toolbarTextButton index:1")
  #sleep 1
  #step "I clear input field number 3"
  #step 'I enter "'+telephone+'" into input field number 3'
  #touch("toolbarTextButton index:1")
  #sleep 1

end

Given(/^I log into Application/) do
  uname=$g_user_details[:username]
  pwd=$g_user_details[:password]
  country=$g_user_details[:country]

  step "I am on 'Login' screen"
  step "I log into the App using #{uname}, #{pwd} and #{country}" if ($g_current_app=='DE_MT')
  step "I log into thomson application" if ($g_current_app=='EN_TH')
  step "I log into nordics application" if ($g_current_app=='NOR_SW')

  sleep 2
  step "I select the Login button"
  step "I must be logged and on Home page"
end


Given(/^I log into thomson application$/) do
  surname=THOMSON_USER[:valid][:surname]
  departureDate=THOMSON_USER[:valid][:departuredate]
  visionShopNumber=THOMSON_USER[:valid][:VisionShopNumber]
  visionBookingRef=THOMSON_USER[:valid][:VisionBookingRef]

  thomson_login(surname, departureDate, visionShopNumber, visionBookingRef)
  #@loginPage.login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)

end

Given(/^I log into nordics application$/) do
  bookingNum = NOR_SWE_USER[:valid][:bookingnumber]
  email = NOR_SWE_USER[:valid][:emailid]
  telephone = NOR_SWE_USER[:valid][:telefon]
  nordics_login(bookingNum, email, telephone)
end

Given(/^I have entered an invalid email and a valid password$/) do
  step "I am on 'Login' screen"
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
    if $g_ios
      step "I clear input field number 1"
      step 'I enter "'+@valid_username+'" into input field number 1'
      step "I touch done"
    elsif $g_android
      step "I clear input field number 2"
      step 'I enter "'+@valid_username+'" into input field number 2'
      step "I press the enter button"
    end
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
    if $g_ios
      step "I clear input field number 1"
      step 'I enter "'+@invalid_username+'" into input field number 1'
    elsif $g_android
      step "I clear input field number 2"
      step 'I enter "'+@invalid_username+'" into input field number 2'
    end

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
  step "I am on 'Login' screen"
  uname=$g_valid_user_details[:email]
  pwd=$g_invalid_user_details[:password]
  country=$g_valid_user_details[:country]
  step "I log into the App using #{uname}, #{pwd} and #{country}"
end

Then(/^I see appropriate password error message$/) do
  @loginPage.check_username_pwd_error
end

Given(/^I submit wrong login details$/) do
  step "I am on 'Login' screen"

  if ($g_current_app=='EN_TH')
    surname=THOMSON_USER[:invalid][:surname]
    departureDate=THOMSON_USER[:invalid][:departuredate]
    visionShopNumber=THOMSON_USER[:invalid][:VisionShopNumber]
    visionBookingRef=THOMSON_USER[:invalid][:VisionBookingRef]
    thomson_login(surname, departureDate, visionShopNumber, visionBookingRef)
  elsif ($g_current_app=='DE_MT')
    uname=$g_user_details[:username]
    pwd="NANA"
    country=$g_user_details[:country]
    step "I log into the App using #{uname}, #{pwd} and #{country}"
  elsif ($g_current_app.match(/NOR/)!= nil)
    bookingNum = NOR_SWE_USER[:valid][:bookingnumber]
    email = NOR_SWE_USER[:valid][:emailid]
    telephone = NOR_SWE_USER[:valid][:telefon]
    nordics_login(bookingNum, email, telephone)
    step "I select the Login button"
  else
    fail "TODO"
  end
  sleep 2
  step "I select the Login button"
end

Then(/^I see correct error messages on login screen$/) do
  sleep 4
  @loginPage.check_login_error_messages
end
