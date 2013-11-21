require 'calabash-android/abase'
require_relative '../../../support/common_methods'
require_relative '../../support/reusable_methods'

class BasePage < Calabash::ABase
  include CommonMethods
  include UKFirstChoice
  include ReusableMethods


  def initialize
    set_strings
  end

  def wait_for_page_to_load(text, time_out)
    begin
      wait_poll({:until_exists => "* text:'#{text}'", :timeout => time_out}) do
      end
    end
  end


  def assert_element_exists(element)
    res = element_exists("* text:'#{element}'")
    if not res
      screenshot_and_raise "No element found with mark or text: #{element}"
    end

  end


  def click_on_text(text)
    performAction('click_on_text', text)
  end

  def wait_for_seconds(timetowait)
    sleep(timetowait)
  end

  #Create result hash for data matching criteria  @@welcome_msg_hash[criteria]
  def create_result_hash(criteria)
    @@result_hash={}
    @@welcome_msg_hash[criteria].each do |message|
      @@result_hash[message]=false
    end
  end

  #Check all results are verified
  def check_result_hash_is_true
    @@welcome_msg_hash[criteria].each do |message|
    end
  end
end
