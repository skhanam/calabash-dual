require_relative '../../../BasePages/Default/login_base_page'

class LoginPage < LoginBasePage

  def login_thomson(surname, departureDate, visionShopNumber, visionBookingRef)
    sleep 3
    enter_details(surname, 1)
    touch("toolbarTextButton index:1")

    enter_date_ios(departureDate)
    touch("toolbarTextButton index:1")

    sleep 2
    keyboard_enter_text(visionShopNumber)
    touch("toolbarTextButton index:1")

    sleep 2
    keyboard_enter_text(visionBookingRef)
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
    #day, month, year=convert_date_to_str(date).split(/-/)
    day, month, year=date.split(/-/)
    sleep(2)

    puts "Departure date:#{date}:"+day+month+year
    day_today, month_today, year_today=DateTime.now.strftime("%d-%B-%Y").split(/-/)
    puts "day_today#{day_today}, month_today#{month_today}, year_today#{year_today}"
    index=2
    # touch("view {description LIKE '*UITextFieldLabel*'} index:#{index.to_i-1}")
    #Set date
    query("pickerTableView index:4", [{selectRow: day.to_i-1}, {animated: 1}, {notify: 1}])
    #query("view text:'#{day_today}' parent pickerTableView", [{selectRow: day.to_i-1}, {animated: 1}, {notify: 1}])
    #query("pickerTableView index:1", [{selectRow: day.to_i-1}, {animated: 1}, {notify: 1}])
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