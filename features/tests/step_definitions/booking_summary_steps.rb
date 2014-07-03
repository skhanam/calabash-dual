When(/^list of my flights in booking summary$/) do
  @bookingSummaryPage.check_products_in_booking_summary("flight")
  end

When(/^list of my hotels in booking summary$/) do
  @bookingSummaryPage.check_products_in_booking_summary("hotel")
end