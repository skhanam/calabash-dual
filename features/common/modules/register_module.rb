require_relative 'base_module'
module RegisterModule

  def self.included(receiver)
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    def check_new_user_reg_page
      check_new_user_reg_screen

      assert_text_elements([@@signup_create_account, @@new_user_registration_salutation,
                            @@new_user_registration_title, @@new_user_registration_firstname,
                           ])

      #screen 2
      scroll_page_and_assert_text(@@new_user_registration_arrival_date)

      assert_text_present @@new_user_registration_last_name
      assert_text_present @@new_user_registration_booking_code
      assert_text_present @@new_user_registration_arrival_date

      #screen 3
      scroll_page_and_assert_text @@new_user_registration_password
      assert_text_present @@signup_create_account

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

  module Tablet
    include BaseModule

    def check_new_user_reg_page
      fail("here")
    end

    def check_title_subtitle
      assert_wait_for_text @@signup_create_account
      assert_text_present @@signup_preamble
    end

    def check_booking_details
      assert_text_present @@signup_your_booking
      assert_text_present @@new_user_registration_salutation
      assert_text_present @@new_user_registration_salutation_hint
      assert_text_present @@signup_first_name
      assert_text_present @@new_user_registration_last_name_hint
      assert_text_present @@new_user_registration_booking_code_hint
      assert_text_present @@new_user_registration_arrival_date_hint
    end

    def check_login_details
      scroll_page_and_assert_text @@signup_create_account, "down", nil, 10, 3
      scroll_page_and_assert_text @@signup_create_account, "down", nil, 10, 3
      scroll_page_and_assert_text @@signup_create_account, "down", nil, 10, 3
      assert_text_present @@login_default_country
    end

    def validate_text var
      case var
        when "Newsletter opt-in"
          scroll_page_and_assert_text @@signup_newsletter, "down", nil, 10, 3
        when "E-Mail newsletter disclaimer"
          scroll_page_and_assert_text @@my_account_newsletter_text, "down", nil, 10, 3
        when "Tick box"
          fail "TODO"
        when "Register button"
          scroll_page_and_assert_text @@signup_signup_cta, "down", nil, 10, 3
      end
    end

  end

end
