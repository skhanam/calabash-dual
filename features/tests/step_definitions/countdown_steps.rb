And(/^I verify number of days left to travel$/) do
  @countDownPage.check_days_left_to_travel
end

And(/^I verify facebook and twitter share icons are visible$/) do
  @commonMethods.check_sharing
end