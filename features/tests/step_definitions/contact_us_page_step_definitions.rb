Then(/^I verify below details on contact page:$/) do |table|
  values=table.raw
  values.each do |var|
    @page.validate_menu_items(var[0])
  end
end

And(/^contact page is displayed with necessary information$/) do
  @page.check_contact_us_page
end