class PostLoginHomeBasePage < BasePage

  #this method checks booking_summary_page is shown, by verifying one element
  def check_post_login_screen
        assert_wait_for_text(@@home_page_post_holiday_title)
  end

def click_ok_on_popup
  click_on_text @@home_page_post_holiday_popup_alert_ok
end

  def check_post_login_page
    assert_wait_for_acc(@@log_out_acc)
    #assert_wait_for_text(@@home_page_post_holiday_number_text)
    assert_wait_for_text(@@home_page_post_holiday_need_help_text)
    assert_wait_for_text(@@home_page_post_holiday_need_help_content_text)
    assert_wait_for_text(@@home_page_post_holiday_email_us_text)
    assert_partial_text "After Travel Customer Support"
  end

  def en_post_holiday_logout
    if element_exists("view text:'#{@@home_page_post_holiday_title}'")
      click_on_text @@home_page_post_holiday_popup_alert_ok if check_text_in_view @@home_page_post_holiday_popup_alert_ok
      sleep 1
      click_acc_label "logout"
      sleep 1
      click_on_text @@logout_confirm_two
      sleep 1
      click_on_text @@logout_confirm
      sleep 4
    end
  end
end
