Then(/^I see hotel (\d+) page$/) do |arg|
  @hotelBasePage.verify_hotel_text(arg.to_i)
end

And(/^I verify below details on hotel page:$/) do |table|
  values=table.raw
  values.each do |var|
    @hotelBasePage.validate_menu_items(var[0], @hotel_num)
  end
end

Given(/^I am on my booking Hotel Page$/) do
  step "I navigate to hotel 1 page using side menu"
end

When(/^I view the Customer satisfaction section$/) do
  pending
end

Then(/^I should see the customer satisfaction ratings on a scale of (\d+) - 100% for$/) do |arg, table|
  # table is a table.hashes.keys # => [:Hotel overall]
  pending
end

When(/^I select call us button on hotel page$/) do
  pending
end

Then(/^I should see an overlay box to call or cancel$/) do
  pending
end