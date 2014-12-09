And(/^I verify number of days left to travel$/) do
  @homePage.check_days_left_to_travel
end

And(/^I verify facebook and twitter share icons are visible$/) do
  @countDownPage.check_sharing_text
  @commonMethods.check_sharing
end

And(/^I verify share icons are visible$/) do
  @countDownPage.check_sharing_text
  step "I verify facebook and twitter share icons are visible" if !$g_nordics_app
end

Then(/^I verify number of days to go on home page$/) do
  sleep 10
  @homePage.check_countdown_days_text
  expected_count=$g_booking.get_countdown_days.to_s
  @page.assert_wait_for_text(expected_count, 20)
  @countdown_biscuit_text=query("#{$g_query_txt}marked:'#{@page.get_val("countdown_biscuit_acc")}' label", :text)  if $g_ios
  @countdown_biscuit_text=query("#{$g_query_txt}marked:'#{@page.get_val("countdown_biscuit_acc")}.' ti.modules.titanium.ui.widget.TiUILabel$1",:text)  if $g_android
  fail "Number of days to go are wrong" if !(@countdown_biscuit_text.include? expected_count)
  @page.assert_text_present(@page.get_val("days_to_go"))
end

Then(/^I should see Im off to destination in message$/) do
  @countDownPage.check_i_am_off_message
end

When(/^I should see the number of days left to travel$/) do
  @countDownPage.check_days_left
end

When(/^I should see the text Hours, Minutes, Seconds with appropriate values$/) do
  @countDownPage.check_text_elements
end

When(/^I should see a share icon allowing me to share my countdown$/) do
  @countDownPage.check_sharing_options
end