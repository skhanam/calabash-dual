require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage
  include BaseModule
  include LoginModule::Eng if $g_ios
  include Phone if $g_phone
  include Tablet if $g_tablet

  def select_help_logging_in
    scroll_page_and_assert_text @@login_page_help_logging_in
    click_on_text @@login_page_help_logging_in
  end


  def click_help_logging_in_tablet
    wait_for_acc_label(escape_quotes(@@welcome_help_link1))
    click_acc_label(escape_quotes(@@welcome_help_link1))
  end

  def select_retrieve_booking_ref
    scroll_page_and_assert_text @@welcome_help_link2
    click_on_text @@welcome_help_link2
    sleep 2
  end

  def see_retrieve_my_booking_page
    assert_wait_for_text @@welcome_help_retrieve_booking_header
  end

  def check_booking_ref_error
    assert_wait_for_text escape_quotes_smart(@@welcome_help_retrieve_booking_error)
  end

  def check_booking_ref_success
    assert_wait_for_text escape_quotes_smart(@@welcome_help_retrieve_booking_success)
  end

  def enter_surname_and_email
    sleep 1
    click_acc_label "Enter surname"
    keyboard_enter_text "martin"
    sleep 1

    click_acc_label "Enter email address"
    keyboard_enter_text "a@b.com"
    sleep 1

    click_acc_label "submitButton"
  end


end

#TODO : Move module to seperate page

module Phone
  include BaseModule


  def verify_login_page
    puts "verify_login_page"
    assert_wait_for_text @@login_page_title
    scroll_page_and_assert_text @@welcome_login_surname
    scroll_page_and_assert_text @@welcome_login_departure_date
    scroll_page_and_assert_text @@welcome_login_booking_reference
    scroll_page_and_assert_text @@login_button
    scroll_page_and_assert_text @@welcome_help_link2
    scroll_page_and_assert_text @@welcome_cta_help_login
  end


  def check_login_error_messages
    assert_wait_for_text @@login_error_text
    assert_text_present @@welcome_login_surname_extra
    assert_text_present @@login_error_departure_date
    assert_text_present @@login_error_surname
  end

  def verify_help_logging_in
    assert_wait_for_text @@welcome_help_cant_login_header
    scroll_page_and_assert_text @@welcome_help_cant_login_description
    scroll_page_and_assert_text escape_quotes_smart(@@welcome_help_cant_login_subtitle)
    scroll_page_and_assert_text @@welcome_help_cant_login_cta
    scroll_page_and_assert_text @@welcome_help_cant_login_iosStore
    scroll_page_and_assert_text @@welcome_help_cant_use_app_cta1
    #scroll_page_and_assert_text @@welcome_help_cant_use_app_cta2
    scroll_page_and_assert_text @@welcome_help_more_issues_body
    scroll_page_and_assert_text @@welcome_help_more_issues_email_title
  end

  def verify_retrieve_my_booking_page
    assert_wait_for_text @@welcome_help_retrieve_booking_header
    scroll_page_and_assert_text @@welcome_help_retrieve_booking_surname
    scroll_page_and_assert_text @@welcome_help_retrieve_booking_email

    scroll_page_and_assert_text @@retrieve_booking_submit
    scroll_page_and_assert_text @@welcome_help_more_issues_body
    scroll_page_and_assert_text @@welcome_help_more_issues_email_title
  end

end

module Tablet
  include BaseModule

  def verify_login_page
    puts "verify_login_page"
    assert_wait_for_text @@login_page_title
    scroll_page_and_assert_text @@welcome_login_surname_hint
    scroll_page_and_assert_text @@welcome_login_departure_date
    scroll_page_and_assert_text @@welcome_login_booking_reference1_hint
    scroll_page_and_assert_text @@welcome_login_booking_reference2_hint
    check_buttons
  end

  def check_buttons
    scroll_page_and_assert_text @@submit_button
    scroll_page_and_assert_text @@welcome_help_link1
    scroll_page_and_assert_text @@welcome_help_link2
  end


  def check_login_error_messages
    assert_wait_for_text @@login_error_text
    assert_text_present @@login_error_banner
    assert_text_present @@login_error_departure_date
    assert_text_present @@login_error_surname
  end

  def verify_help_logging_in
    assert_wait_for_text @@welcome_help_cant_login_header
  end

  def verify_help_logging_in_page
    assert_wait_for_text @@welcome_help_cant_login_description
    assert_wait_for_text escape_quotes_smart(@@welcome_help_cant_login_subtitle)
    assert_wait_for_text @@welcome_help_cant_login_cta
    scroll_modal_view "down"

    assert_wait_for_text escape_quotes_smart(@@welcome_help_cant_login_iosStore)
    assert_wait_for_text @@welcome_help_cant_use_app_cta1
    assert_wait_for_text escape_quotes_smart(@@welcome_help_cant_use_app_cta2) if $g_thomson_app
    assert_wait_for_text escape_quotes_smart(@@welcome_help_cant_use_app_cta1) if $g_firstchoice_app
    scroll_modal_view "down"

    assert_wait_for_text @@welcome_help_more_issues_body
    assert_wait_for_text @@welcome_help_i_need_help
  end

  def verify_retrieve_my_booking_page
    assert_wait_for_text @@welcome_help_retrieve_booking_header
    assert_wait_for_text @@welcome_help_retrieve_booking_surname
    assert_wait_for_text @@welcome_help_retrieve_booking_email
    assert_wait_for_text @@retrieve_booking_submit

    scroll_at_text_element @@retrieve_booking_submit

    assert_wait_for_text @@welcome_help_more_issues_body
    assert_wait_for_text @@welcome_help_more_issues_email_title
  end


end
