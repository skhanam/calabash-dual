require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage
  include BaseModule
  include LoginModule::Eng  if $g_ios

  def check_login_error_messages
    assert_wait_for_text @@login_error_text
    assert_text_present @@welcome_login_surname_extra
    assert_text_present @@login_error_departure_date
    assert_text_present @@login_error_surname
  end
  #
  #assert_wait_for_text @@book_visit_no_holiday_body
  #assert_wait_for_text @@welcome_refuse
  #assert_wait_for_text @@welcome_reasons
  #assert_wait_for_text @@login_with_existing_credentials
  #assert_wait_for_text @@welcome_help_link3

  def login
    if $g_ios

      #@loginPage.login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)
      step "I clear input field number 1"
      step "I clear input field number 3"
      step "I clear input field number 4"

      step 'I enter "'+surname+'" into input field number 1'
      touch("toolbarTextButton index:1")
      sleep 1
      @loginPage.enter_date_ios(departureDate)
      touch("toolbarTextButton index:1")
      sleep 1

      touch("view marked:'bookingReference1'")
      @page.input_text visionShopNumber
      sleep 2

      touch("view marked:'bookingReference2'")
      @page.input_text visionBookingRef
      sleep 2

      touch("toolbarTextButton index:1")
      sleep(2)

    elsif $g_android
      clear_text
      #performAction('clear_numbered_field', 2)
      touch("* marked:'surname.'")
      @page.input_text(surname)

      touch("* marked:'departureDate.'")
      sleep 2
      set_date("android.widget.DatePicker index:0", departureDate)
      #performAction('set_date_with_index', departureDate, 1)
      sleep 2
      if element_exists "* text:'Set'"
        touch("* text:'Set'")
      elsif element_exists "* text:'Done'"
        touch("* text:'Done'")
      end
      sleep 2

      touch("* marked:'bookingReference1.'")
      sleep 1
      @page.input_text(visionShopNumber)
      sleep 1

      touch("* marked:'bookingReference2.'")
      sleep 1
      @page.input_text(visionBookingRef)

      @loginPage.scroll_to_end_of_page

    end
  end

  def verify_login_page
    puts "verify_login_page"
    assert_wait_for_text @@login_page_title

    arr="#{@@login_page_text}".split(/\\n\\n/)
    arr.each do |var|
      assert_partial_text var
    end

    scroll_page_and_assert_text @@welcome_login_surname
    scroll_page_and_assert_text @@welcome_login_departure_date
    scroll_page_and_assert_text @@welcome_login_booking_reference
    scroll_page_and_assert_text @@login_button
    scroll_page_and_assert_text @@welcome_help_link2
    scroll_page_and_assert_text @@welcome_cta_help_login
  end

  def select_help_logging_in
    scroll_page_and_assert_text @@login_page_help_logging_in
    click_on_text @@login_page_help_logging_in
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

  def select_retrieve_booking_ref
    scroll_page_and_assert_text @@welcome_help_link2
    click_on_text @@welcome_help_link2
    sleep 2
  end

  def see_retrieve_my_booking_page
    assert_wait_for_text @@welcome_help_retrieve_booking_header
  end

  def verify_retrieve_my_booking_page
    assert_wait_for_text @@welcome_help_retrieve_booking_header
    scroll_page_and_assert_text @@welcome_help_retrieve_booking_surname
    scroll_page_and_assert_text @@welcome_help_retrieve_booking_email

    scroll_page_and_assert_text @@welcome_help_retrieve_booking_cta
    scroll_page_and_assert_text @@welcome_help_more_issues_body
    scroll_page_and_assert_text @@welcome_help_more_issues_email_title
  end

  def check_booking_ref_error
    assert_wait_for_text escape_quotes_smart(@@welcome_help_retrieve_booking_error)
  end

  def enter_surname_and_email
    sleep 1
    click_accessibility_label "Enter surname"
    keyboard_enter_text "martin"
    sleep 1

    click_accessibility_label "Enter email address"
    keyboard_enter_text "a@b.com"
    sleep 1

    click_accessibility_label "submitButton"
  end
end
