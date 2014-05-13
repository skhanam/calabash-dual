And(/^I verify number of days left to travel$/) do
  @countDownPage.check_days_left_to_travel
end

And(/^I verify facebook and twitter share icons are visible$/) do
  @commonMethods.check_sharing
end

Then(/^I verify number of days to go on home page$/) do
  sleep 10
  @homePage.check_countdown_days_text
  expected_count=CommonMethods.new.get_countdown_days.to_s

  @page.assert_wait_for_text(expected_count,20)
  res=query("#{$g_query_txt}marked:'countdown_biscuit' label",:text).include? expected_count.to_s if $g_ios
  res=query("* contentDescription:'countdown_biscuit.' *",:text).include? expected_count.to_s if $g_android
  fail("Remaining days wrong exp:#{expected_count}") if (res!=true)

end