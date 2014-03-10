# encoding: utf-8
require 'rubyXL'
require_relative '../../common/support/application_strings'
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
    puts "click_on_text:#{text}:"
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
    begin
      return query "* text:'#{txt}'"
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
    assert_wait_for_text(text, 10)
    verify_page_title text

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
  #
  #def verify_page_title(txt, time_out=10)
  #  wait_poll({:until_exists => $g_query_txt+"text:'#{txt}'", :timeout => time_out.to_i}) do
  #    puts text
  #  end
  #end

  def scroll_side_panel(text)
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
end
