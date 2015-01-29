Then(/^I see terms page is displayed correctly$/) do
  #working for phone only
  sleep 2
  @termsPage.check_t_and_c_title
  @termsPage.check_t_and_c_page
end

Then(/^I verify below links on terms page$/) do |table|
  values=table.raw
  values.each do |var|
    @tuiServicePage.validate_menu_items(var[0])
  end
end

When(/^I navigate to terms page from login screen$/) do
  step "I am on 'Login' screen"
  @loginPage.navigate_to_terms
end