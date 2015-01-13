Then(/^I see correct hotel page$/) do
  @hotelPage.verify_hotel_text(@hotel_name)
end

And(/^I verify below links on hotel page:$/) do |table|
  values=table.raw
  values.each do |var|
    @hotelPage.validate_hotel_links(var[0])
  end
end
And(/^I verify below details on hotel page:$/) do |table|
  values=table.raw
  values.each do |var|
    @hotelPage.validate_hotel_details(var[0], @hotel_details)
  end
end

Given(/^I am on my booking Hotel Page$/) do
  step "I navigate to hotel 1 page using side menu"
end

When(/^I view the Customer satisfaction section$/) do
  pending
end


When(/^I select call us button on hotel page$/) do
  @commonMethods.click_call_button
end

Then(/^I should see an overlay box to call or cancel$/) do
  @commonMethods.verify_call_button_overlay
end

