When(/^I am on Home screen$/) do

  if @homePage.check_home_screen(2)==true
    puts "Already on home screen"

    #if @welcomePage.check_welcome_screen #If check if user is not logged in
    #  step "I log into Application"
    #  sleep 5
    #  step "I must be logged and on Home page"
    #else
    #@homePage.check_home_screen(5)
    #end
    @homePage.wait_for_home_page_to_load
    @homePage.wait_for_acc_label("welcome_title")
    sleep 2
  elsif @welcomePage.check_welcome_screen #If check if user is not logged in
    puts "Not logged in"

    step "I log into Application"
    sleep 5
    step "I must be logged and on Home page"
  else
    fail("Application is in unknown state")
  end
end


Then(/^I see welcome screen/) do
  @welcomePage.verify_welcome_screen
end

Then(/^I see welcome page/) do
  @welcomePage.verify_welcome_page
end


When(/^I choose haven't booked through TUI$/) do
  @welcomePage.click_new_here
end

And(/^I have not yet registered with TUI$/) do
  @welcomePage.click_not_yet_registered_with_tui
end

Then(/^I see new user registration page$/) do
  @newUserRegistrationPage.check_new_user_reg_page
end


Then(/^I should see two options:$/) do |table|
  @welcomePage.check_already_registered
  @welcomePage.check_not_registered
end

Then(/^I should see the Sales screen$/) do
  @new_to_tui_page.check_new_to_tui_page
end

When(/^I select 'I havent logged in before'$/) do
  step "I have not yet registered with TUI"
end

When(/^I select 'I have logged in before'$/) do
  @welcomePage.click_already_registered
end

