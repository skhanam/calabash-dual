Then(/^I see conversion rate for (\d+) euros$/) do |arg|
  @currencyConvPage.enter_currency_and_verify(arg)

end