When(/^I am on Home screen$/) do
  $first_run+=1
  if $g_device_reset
    @postHolidayHomepage.en_post_holiday_logout if @page.check_acc_label "logout"
  end

  if @homePage.check_home_screen(1)!=true
    puts "Run count #{$first_run}"
    @commonMethods.close_popup_dialog
    sleep 2

    if @welcomePage.check_welcome_screen
      step "I log into Application"
      sleep 5
      step "I must be logged in and on Home page"
    end
    step "I see verify I am on home screen"
  end
end

Then(/^I see verify I am on home screen/) do
  if @homePage.check_home_screen(10)==true
    #If acc label welcome_title is already present then no need for checking daisy wheel messages
    if @homePage.check_home_elements
    else
      @homePage.wait_for_home_page_to_load
      @homePage.wait_for_home_elements
    end
    sleep 2
  else
    fail "Not logged into APP"
  end
end

Then(/^I see welcome screen/) do
  @welcomePage.verify_welcome_screen
end


When(/^I choose haven't booked through TUI$/) do
  @welcomePage.click_new_here
end

And(/^I have not yet registered with TUI$/) do
  @welcomePage.click_not_yet_registered_with_tui
end

Then(/^I see new user registration page$/) do
  @registrationPage.check_new_user_reg_page
end


Then(/^I should see two options:$/) do |table|
  @welcomePage.check_already_registered
  @welcomePage.check_not_registered
end

Then(/^I should see the Sales screen$/) do
  @new_to_tui_page.check_new_to_tui_page
end

When(/^I select 'I havent logged in before'$/) do
  #Phoneonly
  step "I have not yet registered with TUI"
end

When(/^I select 'I have logged in before'$/) do
  @welcomePage.click_already_registered
end


Then(/^I see the top half has the caption 'Have a booking, Lets login!'$/) do
  #Phoneengonly
  @welcomePage.verify_welcome_screen
end

When(/^the bottom half has the caption 'Havent booked, Lets get inspired!'$/) do
  #Phoneengonly
  @welcomePage.verify_welcome_screen
end

When(/^I tap on the top half of welcome page$/) do
  #Phoneengonly  #find parent of first half of screen and click
  touch "view text:'#{@page.get_val "welcome_login_title"}' parent TiUIView index:2"
end

When(/^I tap on the bottom half of welcome page$/) do
  #Phoneengonly  #find parent of first half of screen and click
  txt=escape_quotes(@page.get_val "welcome_nobooking_subtitle")
  puts query "view text:'#{txt}'"
  touch "view text:'#{txt}' parent TiUIView index:2"
end
Then(/^I touch done button$/) do
  pending
end