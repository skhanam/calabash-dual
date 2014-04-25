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

When(/^I navigate to currency page from travel money page$/) do
  step "I navigate to travel money page from home screen"
  @travelMoneyPage.navigate_to_currency_page
end

Then(/^I verify currency page$/) do
  @travelMoneyPage.verify_travel_money_currency_page
end

When(/^I navigate to money on card page from travel money page$/) do
  step "I navigate to travel money page from home screen"
  @travelMoneyPage.navigate_to_money_on_card
end

Then(/^I verify money on card page$/) do
  @travelMoneyPage.verify_money_on_card_page
end