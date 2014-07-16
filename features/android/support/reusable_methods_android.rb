# encoding: utf-8
require 'rubyXL'
require_relative '../../common/strings/application_strings'
require_relative '../../common/support/reusable_methods'

#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module AndroidReusableMethods
  include AppStrings
  include ReusableMethods

  def ti_enter_details(text, index)
    sleep 1
    query("all TiEditText index:#{index}", setText: "#{text}")
    sleep(1)
  end

  def scroll_side_panel_and_assert(text, index=1)
    scroll_side_panel(text, index)
    assert_text_present text
  end

  def enter_text_android(text)
    sleep 2
    text=text.gsub(' ', '%s')
    command = "#{default_device.adb_command} shell input text '#{text.to_s}'"
    raise "Could not send text" unless system(command)
  end

  #This method avoids calabash from crashing while using single quotes
  def escape_quotes_smart(str)
    #If escape quotes are used dont use again
    if str.include? '\\\''
      return str
    else
      return escape_quotes(str)
    end
  end


  # escape single quotes present within double quotes string ex: "a'b"
  def escape_quotes(str)
    return str.gsub("'", "\\\\\'")
  end

  def click_on_text(text)
    puts "click_on_text(#{text})"
    touch "* text:'#{text}'"
    sleep 1
  end

  def click_back_button
    performAction('go_back')
    sleep 2
  end

  def read_acc_label_text(label)
    query_text=$g_query_txt+"contentDescription:'#{text}.'"
    query(query_text, :text)[0]
  end

  def wait_for_acc_label(text, timeout=10)
    query_txt=$g_query_txt+"contentDescription:'#{escape_quotes_smart(text)}.'"
    begin
      wait_poll({:until_exists => query_txt, :timeout => timeout.to_i}) do
        puts text
        sleep(0.5)
      end
    rescue
      return false
    end
    return true
  end

  def check_text_in_view(txt)
    write_verified_text_to_file "check_text_in_view (#{txt})"

    begin
      res=query "* text:'#{txt}'"

      if res.count==0
        puts "check_text_in_view(#{txt}) res=false"
        return false
      else
        puts "check_text_in_view(#{txt}) res=true"
        return true
      end
        #performAction('wait_for_text', txt, 2)["success"]
    rescue
      return false
    end
  end

  #Using this for acc label
  def wait_for_page_to_load(text, time_out)
    begin
      wait_poll({:until_exists => $g_query_txt+"contentDescription:'#{text}.'", :timeout => time_out}) do
        puts "wait_for_page_to_load: checking text #{text}"
      end
    rescue
      return false
    end
    return true
  end

  def scroll_view(dir)
    if (dir=="up")
      performAction('drag', 50, 50, 70, 90, 10)
    elsif (dir=="down")
      performAction('drag', 50, 50, 90, 70, 10)
    end
  end

  # scroll in specified direction till id is found
  def scroll_page_and_assert_text(id, dir="down", till_id=nil, count=10)
    repeat_count=0
    sleep 1
    write_verified_text_to_file "scroll_page_and_assert_text (#{id})"
    puts "scroll_page_and_assert_text (#{id})"
    puts element_exists("* contentDescription:'#{id}.'") || element_exists("* text:'#{id}'")
    return if (element_exists("* contentDescription:'#{id}.'") || element_exists("* text:'#{id}'"))

    while (repeat_count < count)
      repeat_count+=1
      scroll_view(dir)
      #if text we are searching is found break on success
      break if (element_exists("* contentDescription:'#{id}.'") || element_exists("* text:'#{id}'"))

      #If text is not found even after scrolling till end of page then fail
      if till_id!=nil && (element_exists("* contentDescription:'#{till_id}.'") || element_exists("* text:'#{till_id}'"))
        fail "id/text #{id} not present on screen"
      end

      sleep 0.5
    end
    fail "id/text #{id} not present on screen" if repeat_count==10
    sleep 2
  end

#touch text and verify result
  def touch_txt_and_verify_title(id, text)
    sleep 1
    if element_exists("* text:'#{id}'")
      touch("* text:'#{id}'")
    elsif  element_exists("* contentDescription:'#{id}.'")
      touch("* contentDescription:'#{id}.'")
    else
      fail("id:#{id} not found")
    end

    if ENV['TESTENV']=="EN_FC"
      title_text=UnicodeUtils.upcase(text)
    else
      title_text=text
    end

    assert_wait_for_text(title_text, 10)
    verify_page_title title_text

  end

  def touch_acc_label_and_verify(label_touch, label_expected)
    sleep 1
    if element_exists("* marked:'#{label_touch}'")
      touch("* marked:'#{label_touch}'")
    elsif  element_exists("* contentDescription:'#{label_touch}.'")
      touch("* contentDescription:'#{label_touch}.'")
    else
      fail("id:#{id} not found")
    end
    wait_for_acc_label(label_expected)
  end

  def scroll_side_panel(text, index=1)
    scroll_page_and_assert_text(text)
  end

#Read and Enter data from excel sheet
  def enter_credentials_from_excel(test_data)
    await
    surname=test_data["Surname"]
    touch("all TiEditText index:1")

    enter_details(surname, 1)

    if `adb shell getprop ro.build.version.release`.strip.match(/2.3/)
      $g_ginger_bread=true
    end

    enter_date(test_data["DepartureDate"])
    touch("all TiEditText index:5")
    ti_enter_details(test_data["VisionShopNumber"], 5)
    touch("all TiEditText index:7")
    ti_enter_details(test_data["VisionBookingRef"], 7)
    sleep(1)
    performAction('send_key_enter')
    sleep(1)
    performAction("go_back")

    if ($g_ginger_bread==true)
      sleep(1)
      performAction("scroll_up") #Scroll up for small screen devices
    end
  end


  def get_nav_bar_title
    query("* marked:'navbarTitle.'", :text).first
  end


  def enter_digit_keys (num)
    touch("* contentDescription:'keypad.'  * text:'#{num}'") if element_exists "* contentDescription:'keypad.'  * text:'#{num.to_s}'"
    touch("* contentDescription:'keypad1.' * text:'#{num}'") if element_exists("* contentDescription:'keypad1.' * text:'#{num}'")
    touch("* contentDescription:'keypad2.' * text:'#{num}'") if element_exists("* contentDescription:'keypad2.' * text:'#{num}'")
    touch("* contentDescription:'keypad3.' * text:'#{num}'") if element_exists("* contentDescription:'keypad3.' * text:'#{num}'")
  end

  def delete_entries
    sleep 1
    touch("imageView")
    sleep 1
    touch("imageView")
    sleep 1
    touch("imageView")
    sleep 1
  end

  def enter_date_android(date_int)
    #day, month, year= convert_excel_date_to_str(date_int).split(/-/)
    day, month, year= (date_int).split(/-/)
    puts "day#{day}, month#{month}, year#{year}"
    sleep(1)

    touch("all TiEditText index:2")
    sleep 3
    query("datePicker", {:method_name => :updateDate, :arguments => [year.to_i, month.to_i-1, day.to_i]})
    sleep 1
    performAction('go_back')
    sleep 2
    return

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

end
