require 'calabash-android/abase'
require_relative '../default/login_page_android'

class LoginPage < LoginBasePage

  def check_different_welcome_messages(test_data, criteria)

    enter_credentials_from_excel(test_data)
    @@welcome_msg_hash[criteria].each do |messages|
      if check_text_in_view(messages)==true
        puts "Found text #{messages} one home screen"
        @@result_hash[messages]=true
      end

      puts @@result_hash
    end
    return HomePage.new
  end

end