require_relative '../../common/modules/base_module'

module LoginModule
  include BaseModule

  module Deu
    def enter_valid_user_name
      puts "**************"
      username=$g_user_details[:username]
      enter_text(username,1,"enter")
      return $g_user_details[:username]
    end

    def enter_credentials(username, password)
      puts "IOS 7 key board"
      enter_text(username,1,"enter")
      enter_text(password,2,"enter")
      assert_wait_for_text(username, 10)
    end

    def setCountry(country)
      touch "textFieldLabel index:2"
      sleep 1
      index=picker[0].index(country)
      sleep 1
      touch("view:'UIPickerView' label text:'"+country+"'")
      sleep 2
      touch "view marked:'Fertig'"
      sleep 1
    end
  end

  module Eng
    def enter_date_ios(date)
      #day, month, year=convert_date_to_str(date).split(/-/)
      day, month, year=date.split(/-/)
      sleep(2)

      puts "Departure date:#{date}:"+day+month+year
      day_today, month_today, year_today=DateTime.now.strftime("%d-%B-%Y").split(/-/)
      puts "day_today#{day_today}, month_today#{month_today}, year_today#{year_today}"
      index=2
      #Set date
      query("pickerTableView index:4", [{selectRow: day.to_i-1}, {animated: 1}, {notify: 1}])
      sleep(1)
      query("view text:'#{month_today}' parent pickerTableView", [{selectRow: month.to_i-1}, {animated: 1}, {notify: 1}])
      sleep(1)
      query("view text:'#{year_today}' parent pickerTableView", [{selectRow: year.to_i-1}, {animated: 1}, {notify: 1}])
      sleep(2)
    end
  end

  module Phone
  end

  module Tablet
  end
end
