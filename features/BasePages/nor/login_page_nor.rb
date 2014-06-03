require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage

  def check_login_error_messages
    assert_wait_for_text @@login_error_text
  end

  def verify_login_page
    puts "verify_login_page"
    assert_wait_for_text @@login_page_title
    #scroll_page_and_assert_text @@login_page_text if $g_ios #TODO Need to check why its not working for android

    arr=@@login_page_text.split(/\n\n/)
    arr.each do |var|
      assert_partial_text var
    end

    scroll_page_and_assert_text @@login_page_booking_ref
    scroll_page_and_assert_text @@login_page_email
    scroll_page_and_assert_text @@login_page_telephone

    scroll_page_and_assert_text @@login_button

    scroll_page_and_assert_text @@login_page_help_logging_in
    scroll_page_and_assert_text @@login_page_book_visit
  end

  def select_help_logging_in
    scroll_page_and_assert_text @@login_page_help_logging_in
    click_on_text @@login_page_help_logging_in
  end

  def verify_help_logging_in
    assert_text_present @@login_page_help_logging_in

    arr=@@help_logging_text.split(/\n\n/)
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

  end

  def verify_book_visit

  end

  #def submit_login_button
  #  sleep 1
  #  #click_on_text(@@login_button)
  #  scroll_page_and_assert_text @@login_button
  #  puts "submit_login_button"
  #  count=query("#{$g_query_txt}text:'#{@@login_button}'").count-1
  #  puts "#{$g_query_txt}text:'#{@@login_button}' index:#{count}"
  #  touch("#{$g_query_txt}text:'#{@@login_button}' index:#{count}")
  #  sleep 1
  #end
end
