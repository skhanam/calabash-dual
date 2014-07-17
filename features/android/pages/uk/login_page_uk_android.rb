require 'calabash-android/abase'
require_relative '../../../BasePages/Default/login_base_page'

class LoginPage < LoginBasePage

  def login_thomson(departureDate)
    enter_date_android(departureDate)
  end

#  def check_different_welcome_messages(test_data, criteria)
#    enter_credentials_from_excel(test_data)
#    touch("* text:'Log in' index:1")
#    HomePage.new.await
#
#    @@welcome_msg_hash[criteria].each do |message|
#      welcome_message_from_screen=query("* contentDescription:'welcome_title.'", :text).first.strip
#      puts welcome_message_from_screen
#      if (welcome_message_from_screen.match(/#{message}/)==nil)
#        #  puts "#{welcome_message_from_screen} doesnt match #{message}"
#        #   puts Differ.diff_by_char(welcome_message_from_screen, message)
#      else
#        puts "\n\n\ ** Found text #{message} one home screen ** "
#        #write_welcome_messages_to_file("#{criteria}:#{welcome_message_from_screen.strip}")
#        @@result_hash[message]=@@result_hash[message].to_i+1
#        break
#      end
#    end
#
#    puts @@result_hash
#    return HomePage.new
#  end
#
#
#  #Read and Enter data from excel sheet
#  def enter_credentials_from_excel(test_data)
#    fail("enter_credentials_from_excel")
#    puts "enter_credentials_from_excel:"
#    puts test_data
#
#    sleep 3
#    surname=test_data["Surname"]
#    enter_details(surname, 1)
#    touch("toolbarTextButton index:1")
#
#    enter_date_ios(test_data["DepartureDate"])
#    touch("toolbarTextButton index:1")
#
#    sleep 2
#    keyboard_enter_text(test_data["VisionShopNumber"].to_s)
#    touch("toolbarTextButton index:1")
#
#    sleep 2
#    keyboard_enter_text(test_data["VisionBookingRef"].to_s)
#    touch("toolbarTextButton index:1")
#
#    sleep(2)
#  end
#
#
#
##Read and Enter data from excel sheet
#  def enter_credentials_from_excel(test_data)
#    await
#    surname=test_data["Surname"]
#    touch("all TiEditText index:1")
#
#    enter_details(surname, 1)
#
#    if `adb shell getprop ro.build.version.release`.strip.match(/2.3/)
#      $g_ginger_bread=true
#    end
#
#    enter_date(test_data["DepartureDate"])
#    touch("all TiEditText index:5")
#    ti_enter_details(test_data["VisionShopNumber"], 5)
#    touch("all TiEditText index:7")
#    ti_enter_details(test_data["VisionBookingRef"], 7)
#    sleep(1)
#    performAction('send_key_enter')
#    sleep(1)
#    performAction("go_back")
#
#    if ($g_ginger_bread==true)
#      sleep(1)
#      performAction("scroll_up") #Scroll up for small screen devices
#    end
#  end
end