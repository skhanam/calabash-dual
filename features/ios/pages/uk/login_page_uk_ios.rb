require_relative '../../../BasePages/login_base_page'

class LoginPage < LoginBasePage

  def initialize
    await
  end

  def check_different_welcome_messages(test_data, criteria)
    enter_credentials_from_excel(test_data)
    sleep 2
    flash($g_query_txt+"text:'#{@@login_page_text}'")
    playback "touch_button",{:query => "view marked:'Log in'"}
    #click_on_text("Log in")
    sleep 2

    #if element_exists("label marked:'#{@@login_page_text}'")
    #  scroll("scrollView", :down)
    #  sleep 2
    #  touch("view text:'Help logging in'")
    #  sleep 2
    #  touch("button index:0")
    #  sleep 2
    #  touch("view text:'Log in'")
    #  sleep 2
    #end

    sleep 4

    #Some times login button is not touched first time .. tap on it again
    if (element_exists($g_query_txt+"text:'#{@@login_page_text}'"))
      touch($g_query_txt+"text:'#{@@login_page_text}' index:0")
    end

    @page=HomePage.new.await
    puts "criteria #{criteria} @@welcome_msg_hash[criteria] #{@@welcome_msg_hash[criteria]}"

    @@welcome_msg_hash[criteria].each do |message|
      #welcome_message_from_screen=query("view contentDescription:'welcome_title'", :text).first.strip
      welcome_message_from_screen=nil

      if element_exists("alertView") # if alert view is present then check for message on it and press OK
        if ()
          @@welcome_home_alert
        end
        tap("OK")
      end


      welcome_message_from_screen=get_welcome_message_from_screen

      puts "welcome_message_from_screen:#{welcome_message_from_screen} message:#{message} "

      if (welcome_message_from_screen.match(/#{message}/)==nil)
      else
        puts "\n\n\ ** Found text #{message} on home screen ** "
        #write_welcome_messages_to_file("#{criteria}:#{welcome_message_from_screen.strip}")
        @@result_hash[message]=@@result_hash[message].to_i+1
        break
      end
    end

    puts @@result_hash
    return HomePage.new
  end

  #def write_hash_to_file
  #  write_welcome_messages_to_file(@@result_hash)
  #end


  #Read and Enter data from excel sheet
  def enter_credentials_from_excel(test_data)
    puts "enter_credentials_from_excel:"
    puts test_data

    sleep 3
    surname=test_data["Surname"]
    enter_details(surname, 1)
    touch("toolbarTextButton index:1")

    enter_date_ios(test_data["DepartureDate"])
    touch("toolbarTextButton index:1")

    sleep 2
    keyboard_enter_text(test_data["VisionShopNumber"].to_s)
    touch("toolbarTextButton index:1")

    sleep 2
    keyboard_enter_text(test_data["VisionBookingRef"].to_s)
    touch("toolbarTextButton index:1")

    sleep(2)
  end

  def enter_details(text, index)
    touch("view {description LIKE '*UITextFieldLabel*'} index:#{index.to_i-1}")
    sleep 2
    keyboard_enter_text(text.to_s)
    sleep 1
  end

  def enter_date_ios(date)
    day, month, year=convert_date_to_str(date).split(/-/)
    sleep(2)

    puts "Departure date:#{date} :"+day+month+year
    day_today, month_today, year_today=DateTime.now.strftime("%d-%B-%Y").split(/-/)
    index=2
    # touch("view {description LIKE '*UITextFieldLabel*'} index:#{index.to_i-1}")
    #Set date
    query("view text:'#{day_today}' parent pickerTableView", [{selectRow: day.to_i-1}, {animated: 1}, {notify: 1}])
    query("pickerTableView index:1", [{selectRow: day.to_i-1}, {animated: 1}, {notify: 1}])
    sleep(1)
    query("view text:'#{month_today}' parent pickerTableView", [{selectRow: month.to_i-1}, {animated: 1}, {notify: 1}])
    sleep(1)
    query("view text:'#{year_today}' parent pickerTableView", [{selectRow: year.to_i-1}, {animated: 1}, {notify: 1}])
    sleep(2)
  end

  def convert_date_to_str(date_int)
    d=DateTime.new(1899, 12, 30) + date_int.to_i
    return d.strftime("%d-%m-%Y")
  end
end
