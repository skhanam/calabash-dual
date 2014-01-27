require 'rubyXL'
require_relative '../../support/application_strings'
require_relative '../../support/reusable_methods'

module IosReusableMethods
  include AppStrings
  include ReusableMethods

  def click_on_text(text)
    touch("view text:'#{text}'")
  end

  #
  #def click_on_text(text)
  #  if ENV['OS']=="ios6"
  #    playback "touch_button", {:query => $g_query_txt+"marked:'#{text}'"}
  #  else
  #    touch $g_query_txt+"marked:'#{text}'"
  #  end
  #end

  #Use this method for acc label
  def wait_for_page_to_load(text, time_out)
    begin
      wait_poll({:until_exists => $g_query_txt+"text:'#{text}'", :timeout => time_out}) do
      end
    rescue
      return false

    end
    return true
  end

  def check_text_in_view(text_to_check)
    text_check=escape_quotes_smart(text_to_check)
    res=element_exists("view text:'#{text_check}'")
    if res
      if ($g_flash)
        flash("view text:'#{text_check}'")
      end
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


  #Scroll to text in side panel
  def scroll_side_panel(text)
    section=0
    scroll_to_cell(:row => 0, :section => 0)
    sleep 1
    each_cell(:animate => false, :post_scroll => 0.2) do |row, sec|
      puts "#{query("tableViewCell indexPath:#{row},#{sec} label", :text)}  #{text}"
      if query("tableViewCell indexPath:#{row},#{sec} label", :text).first==text
        break
      end
      section=section+1
    end
    puts "scroll_side_panel:element number:#{section}"
  end

  #touch text and verify result

  def touch_and_verify(label_touch, label_expected)
    touch_transition_timeout=10
    touch_transition_retry=1
    touch_transition("view marked:'#{label_touch}'", "view marked:'#{label_expected}'", {:timeout => touch_transition_timeout, :retry_frequency => touch_transition_retry})
  end

  #Switch language keyboard to english. useful for localisation
  def change_keyboard_to_english
    sleep(2)
    res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")

    if ($g_testlang=="ru_RU") #Handle switching russian to english
      keyboard_enter_char "International"
      sleep(4)
      if (element_exists("view:'UIAlertView' descendant button"))
        touch("view:'UIAlertView' descendant button")
      end
    elsif (res!=true) #Handle all other locale (except russian)
      keyboard_enter_char "International"
      sleep(4)
      if element_exists("view text:'好'")
        touch("view text:'好'")
      elsif (element_exists("view text:'OK'"))
        touch("view text:'OK'")
      end

      res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")
      count=0
      while res!=true && count <5
        keyboard_enter_char "International"
        res=query("view:'UIKBKeyplaneView'", "keyplane")[0].include? ("iPhone-Alphabetic-Keyboard_Small-Letters/Keyplane: 8 properties + 4 subtrees")
        sleep(1)
        count+=1
      end
    end
    sleep(3)
  end


  def scroll_page_till_text_found(id, dir="down")
    count=0
    while count < 10
      if element_exists("view text:'#{id}'") || element_exists("view marked:'#{id}'")
        break
      end
      count+=1
      scroll_view(dir)
    end
    sleep 2
  end

  def scroll_view(dir)
    scroll("scrollView", "down") if dir=="down"
    scroll("scrollView", "up") if dir=="up"
    sleep 0.5
  end


  def scroll_table_to_text(text)
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
end
