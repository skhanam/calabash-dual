Then(/^I see terms page is displayed correctly$/) do
  @termsPage.check_terms_page
end

Then(/^I verify below links on terms page$/) do |table|
  values=table.raw
  values.each do |var|
    @termsPage.validate_menu_items(var[0])
  end
end