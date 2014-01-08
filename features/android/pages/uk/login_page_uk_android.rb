require 'calabash-android/abase'
require_relative '../../../../features/BasePages/login_page'

class LoginPage < LoginBasePage

  def check_different_welcome_messages(test_data, criteria)
    enter_credentials_from_excel(test_data)
    touch("* text:'Log in' index:1")
    @page=HomePage.new.await

    @@welcome_msg_hash[criteria].each do |message|
      welcome_message_from_screen=query("* contentDescription:'welcome_title.'", :text).first.strip
      puts welcome_message_from_screen
      if (welcome_message_from_screen.match(/#{message}/)==nil)
        #  puts "#{welcome_message_from_screen} doesnt match #{message}"
        #   puts Differ.diff_by_char(welcome_message_from_screen, message)
      else
        puts "\n\n\ ** Found text #{message} one home screen ** "
        #write_welcome_messages_to_file("#{criteria}:#{welcome_message_from_screen.strip}")
        @@result_hash[message]=@@result_hash[message].to_i+1
        break
      end
    end

    puts @@result_hash
    return HomePage.new
  end



end