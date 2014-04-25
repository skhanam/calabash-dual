And(/^I verify number of days left to travel$/) do
  @countDownPage.check_days_left_to_travel
end

And(/^I verify facebook and twitter share icons are visible$/) do
  @commonMethods.check_sharing
end

Then(/^I verify number of days to go on home page$/) do
  @homePage.check_countdown_days_text
  @page.assert_wait_for_text(CommonMethods.new.get_countdown_days.to_s)
  fail("Remaining days wrong") if (CommonMethods.new.get_countdown_days.to_s != query("view marked:'countdown_biscuit' label",:text).last)
end