Then(/^I verify excursions page$/) do
  @excursionsPage.check_excursions_page
end

When(/^I select link for excursion$/) do
  @excursionsPage.click_excursions_link
end

Then(/^I see webview with excursions listed$/) do
  @excursionsPage.check_excursions_webview
end

Then(/^I should be navigated to Excursions Mosaic page$/) do
  step "I verify excursions page"
end

When(/^I see excursions - Mosaic landing page$/) do
  @excursionsPage.check_excursion_mosaic(@excursion_num.to_i-1)
end

Given(/^I log into App using no excursions booking$/) do
    step "I am on 'Login' screen"
    @commonMethods.close_popup_dialog
    @commonMethods.close_push_notifications

    #TODO
    fail "TBD not completed"
    if ($g_current_app=='EN_TH' || $g_current_app=='EN_FC')
      surname=$g_current_user_details[:noexcursion][:surname]
      departureDate=$g_current_user_details[:noexcursion][:departuredate]
      visionShopNumber=$g_current_user_details[:noexcursion][:VisionShopNumber]
      visionBookingRef=$g_current_user_details[:noexcursion][:VisionBookingRef]
      uk_login(surname, departureDate, visionShopNumber, visionBookingRef)
      sleep 2
      step "I select the Login button"
    end
end