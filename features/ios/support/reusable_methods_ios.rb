# encoding: utf-8
require 'rubyXL'
require_relative '../../common/strings/application_strings'
require_relative '../../common/support/reusable_methods'
require_relative '../../common/support/view_functions'


module Phone
  #Scroll to text in side panel
  def scroll_side_panel(text, index=1)
    scroll_page_and_assert_text(text)
  end

  def scroll_home_biscuits(txt)
    scroll_page_and_assert_text txt
  end

  def scroll_view(dir, index=0)
    scroll("scrollView", "down") if dir=="down"
    scroll("scrollView", "up") if dir=="up"
    sleep 0.5
  end

end

module Tablet
  def scroll_side_panel(text, dir="down")

    count=5
    puts "scroll_side_panel #{text}"
    while (!element_exists("view text:'#{text}'") && count >0)
      sleep 1
      # scroll_view(dir, 1)
      count-=1
      # puts "To be Removed"  #TODO
      scroll  "view marked:'offCanvasItem_home' parent scrollView",dir
      sleep 1
      puts element_exists("view text:'#{text}'")
      puts "scrolling to #{text}"
    end
    fail("text #{text} not found") if count==0
  end

  def scroll_home_biscuits(txt)
    count=3
    puts "scroll_side_panel #{txt}"
    while (!element_exists("view text:'#{txt}'") && count >0)
      sleep 0.5
      scroll_view("right", 0)
      count-=1
    end
  end

  def scroll_view(dir, index=0)
    scroll("scrollView index:#{index}", dir)
    sleep 1
  end

end

module IosReusableMethods
  include AppStrings
  include ReusableMethods
  include ViewModule

  def self.included(receiver)
    receiver.send :include, Module.const_get("#{$g_hw_module}")
  end

  #Use this method for text
  def wait_for_page_to_load(text, time_out)
    begin
      wait_poll({:until_exists => $g_query_txt+"text:'#{text}'", :timeout => time_out}) do
        puts "waiting for text #{text}"
      end
    rescue
      return false
    end
    return true
  end


  def check_tab_input_field(text, index=1)
    sleep 0.5
    puts "check_tab_input_field #{text}"
    fail("element not present") if !element_exists("TiUIWindow index:#{index} view text:'#{text}'")
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
    return str.gsub("'", "\\\\'")
  end

  def enter_text(text, index, opt="")
    screenshot_and_raise "Index should be positive (was: #{index})" if (index<=0)
    touch("textField index:#{index-1}")
    wait_for_keyboard
    keyboard_enter_text text
    sleep(STEP_PAUSE)
    tap_keyboard_action_key if opt=="enter"
    sleep(STEP_PAUSE)
  end

  def click_on_text(text)
    puts "click_on_text (#{escape_quotes_smart(text)})"
    write_verified_text_to_file "click_on_text (#{text})"
    touch("view text:'#{escape_quotes_smart(text)}'")
    sleep 1
  end

  def click_back_button
    touch("button index:0")
    sleep 2
  end

  def read_acc_label_text(label)
    query_text=$g_query_txt+"accessibilityLabel:'#{label}'"
    query(query_text, :text)[0]
  end

  def wait_for_acc_label(text, timeout=10)
    query_txt=$g_query_txt+"marked:'#{text}'"
    begin
      wait_poll({:until_exists => query_txt, :timeout => timeout.to_i}) do
        puts text
        sleep(0.5)
      end
    rescue
      return false
    end
    flash(query_txt) if $g_flash
    return true
  end

  def check_text_in_view(text_to_check)
    write_verified_text_to_file "check_text_in_view (#{text_to_check})"
    puts "check_text_in_view (#{text_to_check})"
    text_check=escape_quotes_smart(text_to_check)
    res=element_exists("view text:'#{text_check}'")
    if res
      flash("view text:'#{text_check}'") if $g_flash
    end
    return res
  end

  def swipe_dir(dir)
    if dir=="right"
      swipe(:right)
    elsif dir=="left"
      swipe(:left)
    end
  end

  def scroll_side_panel_and_assert(text, index=1)
    scroll_side_panel(text, index)
    assert_text_present text
  end

  #touch text and verify page title
  def touch_txt_and_verify_title(txt_touch, text)
    click_on_text txt_touch
    sleep 2
    verify_page_title text
  end

  #touch text and verify text
  def touch_txt_and_verify_text(txt_touch, text)
    click_on_text txt_touch
    sleep 2
    assert_wait_for_text text
  end

  def touch_acc_label_and_verify(label_touch, label_expected)
    touch_transition_timeout=10
    touch_transition_retry=1
    touch_transition("view marked:'#{label_touch}'", "view marked:'#{label_expected}'", {:timeout => touch_transition_timeout, :retry_frequency => touch_transition_retry})
  end

  #Switch language keyboard to english. useful for localisation
  def change_keyboard_to_english
    sleep(2)
    res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")
    sleep(3)
  end

#Scroll to particular page on text and assert if its not present
#default scrolling direction is down unless specified
  def scroll_page_and_assert_text(id, dir="down", till_id=nil, count=10, index=0)
    write_verified_text_to_file "scroll_page_and_assert_text (#{id})"
    puts "scroll_page_and_assert_text (#{id})"
    id=escape_quotes_smart(id)
    repeat_count=0

    flash("view text:'#{id}'") if (element_exists("view text:'#{id}'") && $g_flash)

    if element_exists("view text:'#{id}'") || element_exists("view marked:'#{id}'")
      puts "scrolled to text (#{id})"
      return
    end

    while repeat_count < count
      repeat_count+=1
      scroll_view(dir, index)

      if element_exists("view text:'#{id}'") || element_exists("view marked:'#{id}'")
        flash("view text:'#{id}'") if element_exists("view text:'#{id}'") if ($g_flash)
        break
      end

      #If text is not found even after scrolling till end of page then fail
      if till_id!=nil && element_exists("view marked:'#{till_id}'")
        fail "id/text #{id} not present on screen"
      end
      sleep 0.5
    end
    fail "id/text :#{id}: not present on screen" if repeat_count==count
    sleep 1
  end

  def scroll_at_acc_label(id,dir="down")
    scroll_at_element "view text:'#{id}",dir
  end


  def scroll_at_text_element(text,dir="down")
    scroll_at_element "view text:'#{text}",dir
  end


  def scroll_at_element(query,dir="down")
   scroll "#{query} parent scrollView",dir
  end

  def scroll_table_to_text(text)
    puts "scroll_table_to_text #{text}"
    wait_poll({:until_exists => "view marked:'#{text}'",
               :timeout => 2}) do
      scroll("tableView", :down)
    end
  end

  def get_welcome_message_from_screen
    label("view:'TiUIView'").each do |var|
      return var.strip if (var!=nil)
    end
  end


  def enter_digit_keys (num)
    touch("view marked:'keypad' label text:'#{num}'") if query("view marked:'keypad' label", :text).include? num.to_s
    touch("view marked:'keypad1' label text:'#{num}'") if query("view marked:'keypad1' label", :text).include? num.to_s
    touch("view marked:'keypad2' label text:'#{num}'") if query("view marked:'keypad2' label", :text).include? num.to_s
    touch("view marked:'keypad3' label text:'#{num}'") if query("view marked:'keypad3' label", :text).include? num.to_s
  end


  def get_nav_bar_title
    puts query("view marked:'navbarTitle'", :text).first
    query("view marked:'navbarTitle'", :text).first
  end

  def delete_entries
    sleep 1
    touch "view marked:'deleteButton'"
    sleep 1
    touch "view marked:'deleteButton'"
    sleep 1
    touch "view marked:'deleteButton'"
    sleep 1
  end

  def check_txt_in_webview txt
    if (query("webView", :stringByEvaluatingJavaScriptFromString => 'document.body.innerHTML')[0].match(/#{txt}/))!=nil
      return true
    end
    return false
  end

  def assert_txt_in_webview txt
    fail "text not found" if !(check_txt_in_webView txt)
  end
end
