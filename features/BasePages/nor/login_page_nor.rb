require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage
  include BaseModule

  def check_login_error_messages
    assert_wait_for_text @@login_error_text
  end

  def verify_login_page
    puts "verify_login_page"
    assert_wait_for_text @@login_page_title

    arr="#{@@login_page_text}".split(/\\n\\n/)
    arr.each do |var|
      assert_partial_text var
    end

    scroll_page_and_assert_text @@login_page_booking_ref
    scroll_page_and_assert_text @@welcome_login_emailTelephone

    scroll_page_and_assert_text @@login_button

    scroll_page_and_assert_text @@login_page_help_logging_in
    scroll_page_and_assert_text @@login_page_book_visit
  end

  def select_help_logging_in
    scroll_page_and_assert_text @@login_page_help_logging_in
    click_on_text @@login_page_help_logging_in
  end

  def verify_help_logging_in
    assert_partial_text @@login_page_help_logging_in.strip

    arr=@@help_logging_text.split(/\\n\\n/)
    arr.each do |var|
      puts var
      assert_partial_text var if var!=""
      sleep 1
    end

    scroll_page_and_assert_text @@help_login_tips

    arr=@@help_login_login_body.split(/:/)
    arr.each do |var|
      puts var
      scroll_page_and_assert_text var if var!=""
      sleep 1
    end

    scroll_page_and_assert_text @@help_logging_kontakt_header
    scroll_page_and_assert_text @@help_logging_kontakt_text
    scroll_page_and_assert_text @@help_logging_ring
    scroll_page_and_assert_text @@help_logging_email
    scroll_page_and_assert_text @@help_logging_privacy_title
  end

  def select_book_visit
    scroll_page_and_assert_text @@login_page_book_visit
    click_on_text @@login_page_book_visit
  end

  def verify_book_visit
    assert_wait_for_text @@book_visit_header
    scroll_page_and_assert_text @@book_visit_holiday_blue_text
    scroll_page_and_assert_text @@book_visit_find_holiday_header
    scroll_page_and_assert_text @@book_visit_no_holiday_header
    scroll_page_and_assert_text @@book_visit_no_holiday_body
    scroll_page_and_assert_text @@book_visit_no_holiday_take_tour_cta
    scroll_page_and_assert_text @@book_visit_no_holiday_call_cta
  end

end
