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

When(/^I submit wrong booking details in booking ref page$/) do
  step 'I enter "'+"Martin"+'" into input field number 1'
  step 'I touch done' if $g_ios
  step 'I press the enter button' if $g_android
  sleep 2
  step 'I enter "'+"a@b.com"+'" into input field number 2'
  step 'I touch done' if $g_ios
  step 'I press the enter button' if $g_android
  sleep 1
  @page.click_on_text "Submit"
end

Then(/^I see error messages on booking ref page$/) do
  @loginPage.check_booking_ref_error
end
