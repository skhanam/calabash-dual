require 'rubyXL'
require_relative '../../support/application_strings'
require_relative '../../support/reusable_methods'
#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module IosReusableMethods
  include AppStrings
  include ReusableMethods

  def click_on_text(text)
    touch("view text:'#{text}'")
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

  # escape if there are + symbols in text
  def escape_plus(str)
    if str.include? '+'
      str.gsub('+', '\\\\+')
    end
    return str
  end

  #This method avoids calabash from crashing while using single quotes
  def escape_quotes_smart(str)
    #If escape quotes are used dont use again
    if str.include? '\\\''
      return str
    else
      return escape_quotes(escape_plus(str))
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

  def touch_text_and_verify(label_touch, label_expected)
    touch_transition_timeout=5
    touch_transition_retry=1
    touch_transition("view marked:'#{label_touch}'", "view marked:'#{label_expected}'", {:timeout => touch_transition_timeout, :retry_frequency => touch_transition_retry})
  end

  def click_back_button
    touch("button index:0")
    sleep 1
  end
end
