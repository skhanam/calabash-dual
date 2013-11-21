require 'calabash-android/abase'
require_relative 'base_page_android'


class WelcomeBasePage < BasePage

  def trait
    @hasharr={}
    "* marked:'Welcome'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def navigate_to_login
    await(:timeout=>5)
    sleep(2)
    click_on_text(@@welcome_page_ready_to_login)
    return LoginPage.new
  end


  def click_login_text
    puts "waiting"
    sleep(5)
    click_on_text(read_str('welcome_cta_login'))
  end

  def await(opts={})
    wait_for_elements_exist([trait], :timeout => 5)
    self
  end

  def login_button_query
    "* text:#{read_str('welcome_login_header')}"
  end

  # Read all data from excel and filter them by matching criteria
  def check_data_from_excel_matching_criteria(criteria)
    hash_arr=read_test_data
    matching_data=[]
    hash_arr.each do |var|
      case criteria
        when "more than 1 day past"
          max_days=-99999
          min_days=-1
      end

      if var["VisionBookingRef"] == nil
        break
      end

      if (var["Pre-In-Post"] >max_days && var["Pre-In-Post"] < min_days)
        matching_data<<var
      end

    end
    matching_data
  end
end