Then(/^I am on search and book screen$/) do
  sleep 2
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
  @page.click_on_text txt
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

Then(/^I check each tile of each row in search and book screen$/) do
  @searchBookPage.check_every_row_every_tile
end


Then(/^I verify below elements on Sign Up For Offers page "([^"]*)"$/) do |arg|
  @searchBookPage.verify_sign_for_offers_text
end

When(/^I verify below options in Sign Up For Offers page "([^"]*)"$/) do |arg|
  @searchBookPage.verify_sign_for_offers_options
end

When(/^I have not entered any fields on search and book screen$/) do
  @searchBookPage.scroll_to_page_end
end

Then(/^the submit button is disabled on search and book screen$/) do
  fail "Submit button must be diasbled" if @searchBookPage.check_submit_button_enabled
end

Then(/^I see email field with pre filled text on search and book page$/) do
  @searchBookPage.scroll_page_and_assert_text @page.get_val "signup_email_hint"
end

When(/^I submit email id and expect appropriate message:$/) do |table|
  text=@page.get_val "signup_email_hint"
  @page.click_on_text text
  while $g_ios && !keyboard_visible?
    sleep STEP_PAUSE
  end

  # table is a | aa         | enter a valid email address |
  values=table.raw
  values.each do |var|
    @page.click_on_text text
    sleep STEP_PAUSE
    clear_text "#{$g_query_txt}text:'#{text}'" if $g_ios
    clear_text if $g_android
    sleep STEP_PAUSE
    @page.input_text var[0]
    sleep STEP_PAUSE
    tap_keyboard_action_key if  $g_ios
    press_enter_button if  $g_android
    sleep STEP_PAUSE
    if var[1]=="no error"
      @page.check_text_in_view "Please enter a valid email address"
    else
      @page.assert_wait_for_text var[1]
    end
    sleep STEP_PAUSE
    text=var[0]
  end
end
When(/^I select first tile on Excursions$/) do
  @searchBookPage.scroll_table_to_row 7
  @arr,@link= @searchBookPage.get_details_for_tile 7, 1
  @page.click_on_text @arr.last
end

Then(/^in-app browser opens displaying the respective page$/) do
  @page.verify_text_present "Holiday Search"
@page.verify_webview_shown @link
end

When(/^I tap the back arrow on search and book webview$/) do
  @page.click_acc_label @page.get_val "home_page_sidepanel_acc_label"
end

Then(/^I am on same position in Search book screen$/) do
  @page.assert_wait_for_text @arr.last # verify text that was clicked
end

When(/^I tap on the search and book tile$/) do
  @searchBookPage.scroll_table_to_row 3
  @arr,@link= @searchBookPage.get_details_for_tile 3, 1
  @page.click_on_text @arr.last
end

Given(/^I have filled in valid data and ticked both check boxes on sign up offers screen$/) do
  @searchBookPage.fill_sign_up_details
end