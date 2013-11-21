When(/^I login with into app and check all messages for "([^"]*)" days$/) do |criteria|
  BasePage.new.create_result_hash(criteria)
  matching_data= @page.check_data_from_excel_matching_criteria(criteria) # Find data matching criteria

  count=10
  while (count>0)
    @page= WelcomePage.new.navigate_to_login
    @page=@page.check_different_welcome_messages(matching_data[0], criteria)
    @page.logout_from_home_screen
    sleep(2)
    count-=1
  end
end

