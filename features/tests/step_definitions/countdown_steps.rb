And(/^I verify number of days left to travel$/) do
  @countDownPage.check_days_left_to_travel
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

  fail "Number of days to go are wrong" if !(query("view marked:'#{@page.get_val("countdown_biscuit_acc")}' label", :text).include? expected_count)
  @page.assert_text_present(@page.get_val("days_to_go"))

  #res=query("#{$g_query_txt}marked:'countdown_biscuit' label", :text).include? expected_count.to_s if $g_ios
  #res=query("* contentDescription:'countdown_biscuit.' *", :text).include? expected_count.to_s if $g_android
  #fail("Remaining days wrong exp:#{expected_count}") if (res!=true)

end