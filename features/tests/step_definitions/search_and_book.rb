Then(/^I am on search and book screen$/) do
  @searchBookPage.verify_search_book_screen
end

When(/^I tap the back arrow on sign up offers$/) do
  @page.assert_wait_for_text @page.get_val "welcome_help_no_holiday_email_header"
  @page.navigate_back_acc_label
end

When(/^I tap the back arrow on search and book$/) do
  @page.click_acc_label @page.get_val "home_page_sidepanel_acc_label"
end

Given(/^I have navigated to search and book screen$/) do
  step %Q{I am on 'Welcome' screen}
  txt=escape_quotes(@page.get_val "welcome_nobooking_subtitle")
  touch "view text:'#{txt}'"
  sleep 2
end

Given(/^I have navigated to sign up offers screen from welcome screen$/) do
  step "I have navigated to search and book screen"
  step "I navigate to sign up for offers from search and book"
end

Given(/^I navigate to sign up for offers from search and book$/) do
  @searchBookPage.navigate_to_sign_up_for_offers
end

Then(/^I verify Sign Up For Offers page is displayed$/) do
  @searchBookPage.verify_sign_for_offers
end

When(/^I see Sign Up For Offers on search and book screen$/) do
  @searchBookPage.verify_search_book_screen

  txt=escape_quotes(@page.get_val "search_book_sign_up")
  @page.assert_wait_for_text txt
end