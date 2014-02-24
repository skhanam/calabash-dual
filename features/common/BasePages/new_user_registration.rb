class NewUserRegistrationBasePage < BasePage

  def check_new_user_reg_screen
    assert_wait_for_text(@@new_user_registration_create_account_text1)

  end

  def check_new_user_reg_page
    check_new_user_reg_screen

    assert_text_elements([@@new_user_registration_create_account_text1, @@new_user_registration_salutation,
                          @@new_user_registration_title, @@new_user_registration_firstname,
                         ])

    #screen 2
    scroll_page_and_assert_text(@@new_user_registration_arrival_date)

    assert_text_elements([@@new_user_registration_last_name, @@new_user_registration_booking_code,
                          @@new_user_registration_arrival_date])

    #screen 3
    scroll_page_and_assert_text @@new_user_registration_password
    assert_text_present @@new_user_registration_create_account_text2

    assert_text_present @@new_user_registration_email
    assert_text_present @@new_user_registration_password

    #screen 4
    scroll_page_and_assert_text @@new_user_registration_need_help
    assert_text_present @@new_user_registration_newsletter
    assert_text_present @@new_user_registration_newsletter_text
    assert_text_present @@new_user_registration_register
    assert_text_present @@new_user_registration_privacy_policy
    assert_text_present @@new_user_registration_need_help

  end

end
