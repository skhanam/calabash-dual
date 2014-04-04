require_relative '../login_base_page'

class LoginPage < LoginBasePage

  def submit_login_button
    sleep 1
    #click_on_text(@@login_button)
    puts "submit_login_button"
    count=query("#{$g_query_txt}text:'#{@@login_button}'").count-1
    puts "#{$g_query_txt}text:'#{@@login_button}' index:#{count}"
    touch("#{$g_query_txt}text:'#{@@login_button}' index:#{count}")
    sleep 1
  end

end
