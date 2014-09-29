Given(/^I log into the App using (.*?), (.*?) and (\w+)/) do |username, password, country|
  meine_tui_login(username, password, country)
end

def meine_tui_login(username, password, country)
  #puts "#{username}, #{password}, #{country}"

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


def uk_login(surname, departureDate, visionShopNumber, visionBookingRef)

  if $g_ios
    #@loginPage.login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)
    step "I clear input field number 1"
    step "I clear input field number 3"
    step "I clear input field number 4"

    step 'I enter "'+surname+'" into input field number 1'
    touch("toolbarTextButton index:1")
    sleep 1
    @loginPage.enter_date_ios(departureDate)
    touch("toolbarTextButton index:1")
    sleep 1

    touch("view marked:'#{@page.get_val("visionShopNumber_acc")}'")
    puts "view marked:'#{@page.get_val("visionShopNumber_acc")}'"
    puts "visionShopNumber #{visionShopNumber}"
    @page.input_text visionShopNumber
    sleep 2

    touch("view marked:'#{@page.get_val("visionBookingRef_acc")}'")
    puts "view marked:'#{@page.get_val("visionBookingRef_acc")}'"
    puts "visionBookingRef #{visionBookingRef}"
    @page.input_text visionBookingRef
    sleep 2


    touch("toolbarTextButton index:1")
    sleep(2)

  elsif $g_android
    clear_text
    #performAction('clear_numbered_field', 2)
    #performAction('clear_numbered_field', 6)
    #performAction('clear_numbered_field', 8)

    touch("* marked:'surname.'")
    @page.input_text(surname)

    touch("* marked:'departureDate.'")
    sleep 2
    set_date("android.widget.DatePicker index:0", departureDate)
    #performAction('set_date_with_index', departureDate, 1)
    sleep 2
    if element_exists "* text:'Set'"
      touch("* text:'Set'")
    elsif element_exists "* text:'Done'"
      touch("* text:'Done'")
    end
    sleep 2

    touch("* marked:'bookingReference1.'")
    sleep 1
    @page.input_text(visionShopNumber)
    sleep 1

    touch("* marked:'bookingReference2.'")
    sleep 1
    @page.input_text(visionBookingRef)

    @loginPage.scroll_to_end_of_page

  end
end


def nordics_login(bookingNum, email, telephone)
  if $g_ios
    step "I clear input field number 1"
    step "I clear input field number 2"
    step "I clear input field number 3"

    step 'I enter "'+bookingNum+'" into input field number 1'
    sleep 1
    touch("toolbarTextButton index:1")
    sleep 1
    step "I clear input field number 2"
    #step 'I enter "'+email+'" into input field number 2' #uncomment this line for email booking
    sleep 1
    touch("toolbarTextButton index:2")
    sleep 2
    step 'I enter "'+telephone+'" into input field number 3'
    touch("toolbarTextButton index:1")
    sleep 1

  elsif $g_android
    clear_text
    #performAction('clear_numbered_field', 2)
    #performAction('clear_numbered_field', 4)
    #performAction('clear_numbered_field', 6)

    touch("* marked:'bookingReference.'")
    @page.input_text(bookingNum)

    #touch("* marked:'emailid.'")
    #@page.enter_text_android(email)
    touch("* marked:'telephone.'")
    @page.input_text(telephone)

    touch("* marked:'bookingReference.'")

    @loginPage.scroll_to_end_of_page

  end
end

Given(/^I submit correct login credentials/) do
  uname=$g_user_details[:username]
  pwd=$g_user_details[:password]
  country=$g_user_details[:country]

  step "I log into the App using #{uname}, #{pwd} and #{country}" if ($g_current_app=='DE_MT')
  step "I log into thomson application" if ($g_current_app=='EN_TH')
  step "I log into first choice application" if ($g_current_app=='EN_FC')
  step "I log into nordics application" if ($g_current_app.match(/NOR/)!=nil)

  sleep 2
  step "I select the Login button" if !$g_german_app
  step "I select the Login text" if $g_german_app
  step "I must be logged in and on Home page"
end

Given(/^I log into Application/) do
  step "I am on 'Login' screen"
  step "I submit correct login credentials"
end

Given(/^I submit credentials with wrong country selected/) do
  uname=$g_user_details[:username]
  pwd=$g_user_details[:password]
  country="Schweiz"

  step "I am on 'Login' screen"
  step "I log into the App using #{uname}, #{pwd} and #{country}" if ($g_current_app=='DE_MT')

  sleep 2
  step "I select the Login text"
end

Given(/^I log into first choice application$/) do
  surname=$g_current_user_details[:valid][:surname]
  departureDate=$g_current_user_details[:valid][:departuredate]
  visionShopNumber=$g_current_user_details[:valid][:VisionShopNumber]
  visionBookingRef=$g_current_user_details[:valid][:VisionBookingRef]

  uk_login(surname, departureDate, visionShopNumber, visionBookingRef)
  #@loginPage.login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)

end
Given(/^I log into thomson application$/) do
  surname=$g_current_user_details[:valid][:surname]
  departureDate=$g_current_user_details[:valid][:departuredate]
  visionShopNumber=$g_current_user_details[:valid][:VisionShopNumber]
  visionBookingRef=$g_current_user_details[:valid][:VisionBookingRef]

  uk_login(surname, departureDate, visionShopNumber, visionBookingRef)
end

Given(/^I log into nordics application$/) do
  bookingNum = NOR_USER[:valid][:bookingnumber]
  email = NOR_USER[:valid][:emailid]
  telephone = NOR_USER[:valid][:telefon]
  nordics_login(bookingNum, email, telephone)
end

Given(/^I have entered an invalid email and a valid password$/) do
  step "I am on 'Login' screen"
  @uname=$g_invalid_user_details[:email]
  @pwd=$g_valid_user_details[:password]
  @country=$g_valid_user_details[:country]
  step "I log into the App using #{@uname}, #{@pwd} and #{@country}"
end

Given(/^I am on 'Login' screen/) do

  #TODO hack for login screen
  if $g_tablet && $g_ios
    @page.assert_wait_for_acc "swipeDown"
    #scroll("scrollView index:2",:up)
    #sleep 2
    #scroll("scrollView index:2",:up)
    #sleep 2

    @page.click_accessibility_label "swipeDown"
    sleep 2
  end
  #
  ##TODO hack for login screen
  #if $g_german_app && $g_tablet && $g_ios
  #  sleep 10
  #  scroll("scrollView index:2",:up)
  #  sleep 2
  #  scroll("scrollView index:2",:up)
  #  sleep 10
  #end

  @commonMethods.close_whats_new_dialog

  @welcomePage.navigate_to_login if $g_german_app && $g_phone
  @loginPage.check_login_screen
end

Given(/^I am on 'Welcome' screen/) do
  @commonMethods.close_whats_new_dialog
  @welcomePage.verify_welcome_screen
end


Given(/I am on welcome page$/) do
  @welcomePage.verify_welcome_page
end

When(/^I set country (\w+) in login screen$/) do |var|
  @loginPage.setCountry(var)
end


When(/^I enter "(.*?)" and "(.*?)" in login page$/) do |username, password|
  @loginPage.enter_credentials(username, password)
end

Then(/^I see login Page/) do
  @loginPage.verify_login_page
end

Then(/^I see login screen$/) do
  @loginPage.check_login_screen
end

When(/^I fill (valid|invalid) username in login screen$/) do |condition|
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
    @invalid_username = $g_current_user_details[:invalid][:email]
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

  fail 'TODO' if condition.eql? 'valid'
  @forgotPasswordPage.submit_change_password
end

Then(/^I see appropriate error message$/) do
  @forgotPasswordPage.check_wrong_username_email
end


When(/^I select the Login text$/) do
  text="Anmelden" if $g_phone
  text="SPEICHERN" if $g_tablet
  @loginPage.scroll_page_and_assert_text(text)
  @loginPage.click_on_text(text)
end

When(/^I submit Login details$/) do
  step "I select the Login button" if !$g_german_app
  step "I select the Login text" if $g_german_app
end

When(/^I select the Login button$/) do
  @loginPage.submit_login_button
end

Then(/^I see appropriate username error message$/) do
  @loginPage.check_login_error_messages
end

Given(/^I enter valid email and invalid password$/) do
  uname=$g_valid_user_details[:email]
  pwd=$g_invalid_user_details[:password]
  country=$g_valid_user_details[:country]
  step "I log into the App using #{uname}, #{pwd} and #{country}"

end
Given(/^I have entered an valid email and invalid password$/) do
  step "I am on 'Login' screen"
  step "I enter valid email and invalid password"
end

Then(/^I see appropriate password error message$/) do
  @loginPage.check_login_error_messages
end

Given(/^I submit wrong login details$/) do
  step "I am on 'Login' screen"

  @commonMethods.close_whats_new_dialog
  @commonMethods.close_push_notifications

  if ($g_current_app=='EN_TH' || $g_current_app=='EN_FC')
    surname=$g_current_user_details[:invalid][:surname]
    departureDate=$g_current_user_details[:invalid][:departuredate]
    visionShopNumber=$g_current_user_details[:invalid][:VisionShopNumber]
    visionBookingRef=$g_current_user_details[:invalid][:VisionBookingRef]
    uk_login(surname, departureDate, visionShopNumber, visionBookingRef)
    sleep 2
    step "I select the Login button"
  elsif ($g_current_app=='DE_MT')
    step "I enter valid email and invalid password"
    sleep 2
    step "I select the Login text"
  elsif ($g_nordics_app)
    bookingNum = NOR_USER[:invalid][:bookingnumber]
    email = NOR_USER[:invalid][:emailid]
    telephone = NOR_USER[:invalid][:telefon]

    nordics_login(bookingNum, email, telephone)
    sleep 2
    step "I select the Login button"
  else
    fail "TODO"
  end

end

Then(/^I see correct error messages on login screen$/) do
  sleep 4
  @loginPage.check_login_error_messages
end


Then(/^I verify text content on login screen$/) do
  screenshot(options={:name => "Login"}) if ENV['TAKE_SS']=="yes"
  @loginPage.verify_login_page
end

When(/^I select help logging in page$/) do
  @loginPage.select_help_logging_in

end

Then(/^I verify help logging in page$/) do
  @loginPage.verify_help_logging_in

end

When(/^I select book visit page$/) do
  @loginPage.select_book_visit
end

Then(/^I verify book visit page$/) do
  @loginPage.verify_book_visit
end


Then(/^I verify input elements on login page$/) do
  @loginPage.check_input_elements
end

When(/^I verify button elements on login page$/) do
  @loginPage.check_buttons
end

When(/^I select register option from welcome screen$/) do
  @loginPage.click_register_button
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
When(/^I submit wrong login credentials$/) do
  step 'I have entered an invalid email and a valid password'
  step 'I submit Login details'
end
Then(/^I should see the error message tip to side of oops message$/) do
  step "I see appropriate username error message"
end

When(/^should observe that values entered are retained$/) do
  @page.assert_wait_for_text @uname
  @page.assert_wait_for_text @country
end

Given(/^I login with post holiday data$/) do
  if $g_tablet
    @page.assert_wait_for_acc "swipeDown"
    @page.click_accessibility_label "swipeDown"
    sleep 2
  else
    fail "TBD for phone"
  end

  if ($g_current_app=='EN_TH' || $g_current_app=='EN_FC')
    surname=$g_current_user_details[:post][:surname]
    departureDate=$g_current_user_details[:post][:departuredate]
    visionShopNumber=$g_current_user_details[:post][:VisionShopNumber]
    visionBookingRef=$g_current_user_details[:post][:VisionBookingRef]

    uk_login(surname, departureDate, visionShopNumber, visionBookingRef)
    sleep 2
    step "I select the Login button"
    sleep 3
  else
    fail "TODO"
  end

end
