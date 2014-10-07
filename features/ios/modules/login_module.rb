require_relative '../../common/modules/base_module'

module LoginModule
  include BaseModule


  module Deu
    include BaseModule

    def select_register_button
    touch_txt_and_verify_text @@signup_signup_cta,@@signup_create_account
    end

    def enter_valid_user_name
      puts "**************"
      username=$g_user_details[:username]
      enter_text(username, 1, "enter")
      return $g_user_details[:username]
    end

    def enter_credentials(username, password)
      puts "IOS 7 key board"
      enter_text(username, 1, "enter")
      enter_text(password, 2, "enter")
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


    def check_hint_text
      assert_text_present "Benutzername / E-Mail" #@@email_hint_text
      assert_text_present @@login_password_hint
      assert_text_present @@login_default_country
    end

    def check_info_button
      res=query "view marked:'#{@@welcome_page_hint_icon}'"
      fail if res.count != 3
    end

    def check_forgot_link
      assert_text_present @@login_forgot_password
    end

    def check_login_button
        assert_text_present @@login_button
    end

    def check_register_link
        assert_text_present @@signup_signup_cta
    end

    def check_need_help_link
      assert_text_present @@i_need_help
    end

  end

  module Eng
    def check_hint_text
      check_input_elements
    end

    def check_input_elements
      fail "remove this"
      assert_text_present "Enter surname" #@@email_hint_text
      assert_text_present "Departure date"
      assert_text_present "1234"
      assert_text_present "12345678"

      assert_wait_for_text @@welcome_login_surname_hint
      assert_wait_for_text @@welcome_login_departure_date
      assert_wait_for_text @@welcome_login_booking_reference2_hint
      assert_wait_for_text @@welcome_login_booking_reference1_hint
    end

    def enter_date_ios(date)
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


end
