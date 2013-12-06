require_relative '../../../BasePages/login_page'

class LoginPage < LoginBasePage

  def initialize
    await
  end

  def check_different_welcome_messages(test_data, criteria)
    enter_credentials_from_excel(test_data)

    scroll("view",:down)
    sleep(2)
    flash($g_query_txt+"text:'#{@@login_page_text}'")
    touch($g_query_txt+"text:'#{@@login_page_text}'")

    @page=HomePage.new.await

    @@welcome_msg_hash[criteria].each do |message|
      welcome_message_from_screen=query("* contentDescription:'welcome_title.'", :text).first.strip
      if (welcome_message_from_screen.match(/#{message}/)==nil)
      else
        puts "\n\n\ ** Found text #{message} one home screen ** "
        write_welcome_messages_to_file("#{criteria}:#{welcome_message_from_screen.strip}")
        @@result_hash[message]=@@result_hash[message].to_i+1
        break
      end
    end

    puts @@result_hash
    return HomePage.new
  end

  def write_hash_to_file
    write_welcome_messages_to_file(@@result_hash)
  end


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
    puts day, month, year
    sleep(2)

    puts "Departure date:#{date}"
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
