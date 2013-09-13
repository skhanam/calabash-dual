require 'calabash-android/abase'


class BasePage < Calabash::ABase


  def wait_for_page_to_load(text,time_out)
    begin
      wait_poll({:until_exists => "* text:'#{text}'", :timeout => time_out}) do
      end
    end
  end


  def assert_element_exists(element)
    res =  element_exists("* text:'#{element}'")
    if not res
      screenshot_and_raise "No element found with mark or text: #{element}"
    end

  end


  def click_on_text(text)
    performAction('click_on_text',text)
  end

  def wait_for_seconds(timetowait)
    sleep(timetowait)
  end


end
