require 'calabash-cucumber/ibase'
require 'calabash-cucumber/tests_helpers'

class BasePage < Calabash::IBase

  def assert_element_exists(element)

    res = element_exists("label text:'#{element}'")

    if not res

      screenshot_and_raise "No element found with mark or text: #{element}"

    end

  end


  def click_on_text(text)

    touch("label marked:'#{text}'")

    sleep 4

  end

  def wait_for_seconds(timetowait)

    sleep(timetowait)

  end

end
