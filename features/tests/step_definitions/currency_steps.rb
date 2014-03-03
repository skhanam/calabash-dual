Then(/^I see conversion rate for (\d+) euros$/) do |arg|
  @currencyConvPage.enter_currency_and_verify(arg)

end

Then(/^I default currency values pre-filled in the screen$/) do
  step "I see conversion rate for 400 euros"
end

When(/^I select on the currency swap icon$/) do
  @currencyConvPage.select_currency_swap_icon
end

Then(/^I see currency pairs should swap places$/) do
  @currencyConvPage.check_currency_swapped
end