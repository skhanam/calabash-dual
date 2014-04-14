require_relative '../Default/login_base_page'

class LoginPage < LoginBasePage

  def check_login_error_messages
    assert_wait_for_text @@login_error_text
    assert_text_present @@login_error2_text
    fail("check_login_error_messages:TBD")
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
