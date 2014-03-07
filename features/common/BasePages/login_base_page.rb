class LoginBasePage < BasePage

  def check_username_pwd_error
    assert_text_present @@username_email_error
  end


  def verify_login_screen
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'"])
  end

  def trait
    $g_query_txt+"marked:'#{@@login_page_text}'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def click_forgot_password
    click_on_text @@password_reset
    assert_wait_for_text @@forgot_password_title
  end

  def enter_default_username_password
    username= $g_user_details[:username]
    password= $g_user_details[:password]
    enter_credentials(username, password)
  end

  #TODO for privacy policy terms and conditions
  #to check html use these queries
  #js = 'document.body.innerHTML'
  #query("webView", :stringByEvaluatingJavaScriptFromString => js)
  #query("webView xpath:'/html/body/text()[4]'")
  #query("webView xpath:'html/body/strong[3]/p'")

  def navigate_to_forgot_password
    click_on_text @@login_forgot_password
    assert_wait_for_text @@forgot_password_title
  end

  def submit_login_button
    sleep 1
    click_on_text(@@login_button)
    return HomePage.new
  end

  def check_login_screen
    assert_wait_for_text(@@login_page_text)
  end


  def enter_date(date_int)
    day, month, year= convert_excel_date_to_str(date_int).split(/-/)
    puts day, month, year
    sleep(1)

    #Commented code is useful to set date in nexus4 (OS 4.3)
    puts "DATE: #{day}#{getDayNumberSuffix(day)} #{month} #{year}"
    touch("all TiEditText index:3")
    #Set date
    if ($g_ginger_bread==true)
      date_string ="* id:'timepicker_input' index:1"
      year_string ="* id:'timepicker_input' index:2"
      month_string ="* id:'timepicker_input' index:0"

      date_increment="* id:'day' child android.widget.NumberPickerButton id:'increment'"
      date_decrement="* id:'day' child android.widget.NumberPickerButton id:'decrement'"
      month_increment="* id:'month' child android.widget.NumberPickerButton id:'increment'"
      month_decrement="* id:'month' child android.widget.NumberPickerButton id:'decrement'"
      year_increment="* id:'year' child android.widget.NumberPickerButton id:'increment'"
      year_decrement="* id:'year' child android.widget.NumberPickerButton id:'decrement'"
    else
      date_string ="* id:'numberpicker_input' index:0"
      year_string ="* id:'numberpicker_input' index:2"
      month_string ="* id:'numberpicker_input' index:1"
      date_increment="* contentDescription:'Increase day'"
      date_decrement="* contentDescription:'Decrease day'"
      month_increment="* contentDescription:'Increase month'"
      month_decrement="* contentDescription:'Decrease month'"
      year_increment ="* contentDescription:'Increase year'"
      year_decrement ="* contentDescription:'Decrease year'"
    end

    date_value = query(date_string, :text)[0].to_i
    month_value =query(month_string, :text)[0].to_s
    year_value=query(year_string, :text)[0].to_i

    #Set date
    if date_value > day.to_i
      date_change=date_decrement
    else
      date_change=date_increment
    end

    while (query(date_string, :text)[0].to_i != day.to_i)
      sleep(0.5)
      touch(date_change)
    end

    #Set Month
    while (month_value != month)
      sleep(0.5)
      touch(month_increment)
      month_value =query(month_string, :text)[0].to_s
    end


    #Set year
    while (year_value != year.to_i)
      sleep(0.25)
      if year_value > year.to_i
        touch(year_decrement)
      elsif year_value < year.to_i
        touch(year_increment)
      end

      year_value=(query(year_string, :text)[0].to_i)
    end


    sleep(1)
    touch("button text:'Set'")
    sleep(1)

  end

  def getDayNumberSuffix(day)
    day=day.to_i
    if (day >= 11 && day <= 13)
      return "th";
    end

    case day%10
      when 1
        return "st"
      when 2
        return "nd"
      when 3
        return "rd"
      else
        return "th"
    end
  end


  def navigate_to_terms
    scroll_page_and_assert_text @@privacy_terms_of_use
    click_on_text @@privacy_terms_of_use
  end
end
