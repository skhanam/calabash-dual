require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage

  #def submit_login_button
  #  sleep 1
  #  scroll_to_end_of_page
  #  puts "submit_login_button"
  #  count=query("#{$g_query_txt}text:'#{@@login_button}'").count-1
  #  puts "#{$g_query_txt}text:'#{@@login_button}' index:#{count}"
  #  touch("#{$g_query_txt}text:'#{@@login_button}' index:#{count}")
  #  sleep 1
  #end


  def check_login_error_messages
    assert_wait_for_text @@login_error_text
    assert_text_present @@login_error_booking_ref
    assert_text_present @@login_error_departure_date
    assert_text_present @@login_error_surname
  end
end
