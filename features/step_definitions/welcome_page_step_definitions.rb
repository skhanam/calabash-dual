When(/^I login with into app and check all messages for "([^"]*)" days$/) do |criteria|
  $g_write_to_file=true
  BasePage.new.create_result_hash(criteria)
  matching_data=@page.check_data_from_excel_matching_criteria(criteria) # Find data matching criteria
  puts matching_data[1]

  #count=1 #How many times welcome messages have to be checked
  #total_count=count
  #while (count>0)
  #  @page=@page.navigate_to_login
  #  @page=@page.check_different_welcome_messages(matching_data[1], criteria)
  #  sleep(2)
  #  count-=1
  #  @page=@page.logout_from_home_screen
  #end
  #@page.write_welcome_messages_to_file("\nTest criteria :#{criteria}:")
  #@page.write_hash_to_file(total_count)
end

