When(/^I login with into app and check all messages for "([^"]*)" days$/) do |criteria|
  $g_write_to_file=true
  BasePage.new.create_result_hash(criteria)
  matching_data=@page.check_data_from_excel_matching_criteria(criteria) # Find data matching criteria
  puts matching_data[1]

  count=1 #How many times welcome messages have to be checked
  total_count=count
  while (count>0)
    @welcomePage.navigate_to_login
    @loginPage.check_different_welcome_messages(matching_data[1], criteria)
    sleep(2)
    count-=1
    @homePage.logout_from_home_screen
  end
  @page.write_welcome_messages_to_file("\nTest criteria :#{criteria}:")
  @page.write_hash_to_file(total_count)
end


When(/^I am on Home screen$/) do

  if @welcomePage.check_welcome_screen #If check if user is not logged in
    step "I log into Application"
    sleep 5
    @homePage.wait_for_home_page_to_load
    @homePage.check_home_screen
  else
    @homePage.check_home_screen
    @homePage.wait_for_home_page_to_load
  end
end


Then(/^I see welcome screen/) do
  @welcomePage.verify_welcome_screen
end

Then(/^I see welcome page/) do
  @welcomePage.verify_welcome_page
end

When(/^I choose am already a customer$/) do
  @welcomePage.click_already_customer
end

And(/^I have already registered with TUI$/) do
  @alreadyCustomerBasePage.check_already_customer_page
  @alreadyCustomerBasePage.click_already_registered
end

Then(/^I see new to TUI page$/) do
  @new_to_tui_page.check_new_to_tui_page
end

When(/^I choose haven't booked through TUI$/) do
  @welcomePage.click_new_here
end

And(/^I have not yet registered with TUI$/) do
  @alreadyCustomerBasePage.click_not_yet_registered_with_tui
end

Then(/^I see new user registration page$/) do
  @newUserRegistrationBasePage.check_new_user_reg_page
end

And(/^I check new to TUI video$/) do
  @new_to_tui_page.check_new_to_tui_video
end

When(/^I navigate to new user registration page$/) do
  step "I choose am already a customer"
  step "I have not yet registered with TUI"
end