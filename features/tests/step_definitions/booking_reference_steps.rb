When(/^I select retrieve my booking reference number$/) do
  @loginPage.select_retrieve_booking_ref
end

Then(/^I see retrieve my booking page$/) do
  @loginPage.see_retrieve_my_booking_page
end

Then(/^I verify retrieve my booking page$/) do
  @loginPage.verify_retrieve_my_booking_page
end

Given(/^I am booking reference page$/) do
  step %Q{I am on 'Login' screen}
  step "I select retrieve my booking reference number"
  step "I see retrieve my booking page"
end


When(/^I submit (wrong|correct) booking details in booking ref page$/) do |condition|
  step 'I enter wrong booking details in booking ref page'
  @page.click_on_text "Submit" if $g_phone
end

When(/^I enter (wrong|correct) booking details in booking ref page$/) do |condition|

  if condition.eql? 'wrong'
    @surname="Martin"
    @email="a@b.com"
  elsif condition.eql? 'correct'
    @surname="Martin"
    @email="dan.12347077@creator.co.uk"
  end

  step 'I enter "'+"#{@surname}"+'" into input field number 1' if $g_ios
  step 'I enter "'+"#{@surname}"+'" into input field number 2' if $g_android
  @page.click_return_key
  sleep 2
  step 'I enter "'+"#{@email}"+'" into input field number 2' if $g_ios
  step 'I enter "'+"#{@email}"+'" into input field number 3' if $g_android
  @page.click_return_key
  sleep 1
  #@page.click_on_text "Submit" if $g_phone
end

Then(/^I see error messages on booking ref page$/) do
  @loginPage.check_booking_ref_error
end

Then(/^I see success messages on booking ref page$/) do
  @loginPage.check_booking_ref_success
end