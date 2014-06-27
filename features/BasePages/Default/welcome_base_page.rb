class WelcomeBasePage < BasePage

  def check_welcome_screen
    return wait_for_text(@@already_customer_title, 5)
  end

  def verify_welcome_screen
    assert_wait_for_text(@@already_customer_title)
  end

  def verify_welcome_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@already_customer_title}'"],
                            :timeout => 5)
    check_welcome_screen
    assert_text_elements([@@already_customer_title,
                          @@already_registered,
                          @@login_with_existing_credentials,
                          @@not_yet_registered
                         ])
    sleep 2

  end

  def await(opts={})
    wait_for_elements_exist([trait], :timeout => 5)
    self
  end

  def navigate_to_login
    @welcome.close_whats_new_dialog
    @welcome.close_push_notifications
    check_welcome_screen
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    sleep 1
    assert_wait_for_text(@@login_page_text, 5)
  end

  def click_new_here
    scroll_page_and_assert_text @@have_never_booked_through_TUI_before
    click_on_text @@have_never_booked_through_TUI_before
    assert_wait_for_text @@new_to_tui_discover_tui
  end

  def click_already_registered
    click_on_text @@login_with_existing_credentials
    assert_wait_for_text @@login_page_text
  end

  def click_register_to_tui
    fail("TODO")
  end

  def click_not_yet_registered_with_tui
    click_on_text @@not_yet_registered
    assert_wait_for_text @@new_user_registration_create_account_text1
    return NewUserRegistrationBasePage.new
  end


  def check_already_registered
    assert_wait_for_text @@already_registered
    assert_wait_for_text @@login_with_existing_credentials
  end

  def check_not_registered
    assert_wait_for_text @@not_yet_registered
    assert_wait_for_text @@register_with_booking_code
  end


  def close_whats_new_dialog
    if element_exists("#{$g_query_txt}text:'#{@@app_update_popup_title}'")
      arr=@@app_update_popup_body.split(/\n/)
      arr.each do |var1|
        res=var1.match(/(\w+)/)
        assert_partial_text(res[0])
      end
      click_on_text @@ok
    end
  end

  def close_push_notifications
    if element_exists("#{$g_query_txt}text:'#{@@push_notifications}'")
      assert_wait_for_text @@we_would_like_to_send_push
      assert_wait_for_text @@push_not_now
      touch ("#{$g_query_txt}text:'#{@@push_not_now}'")
      sleep 2
    end
  end

end