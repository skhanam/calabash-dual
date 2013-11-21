require 'calabash-cucumber/ibase'
require 'calabash-cucumber/tests_helpers'
require_relative 'read_strings'
re

class BasePage < Calabash::IBase
  include ReadStrings
  include UKFirstChoice

  def initialize
    set_strings
  end

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

  def click_back_button_on_page()

    touch(query("button")[0])

    sleep 3

  end

  def click_menu_button_on_page()

    touch(query("button")[0])

    sleep 3

  end

  def transition_link(text)

    "label marked:'#{text}'"

  end

  def transition_to_page(page_name, text)

    transition(:tap => transition_link(text), :page => new_page_type(page_name))

    sleep 5

  end

  def page_exists?(page_name)

    @page = new_page_type(page_name)

    check_element_exists(@page.trait)

  end


end
