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
    await(:timeout => 5)
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

    case criteria
      when "43 or more days"
        min_days, max_days=43, 99999
      when "29 to 42 days"
        min_days, max_days= 29, 42
      when "15 to 28 days"
        min_days, max_days=15, 28
      when "7 to 14 days"
        min_days, max_days=7, 14
      when "1 to 6 days"
        min_days, max_days=1, 6
      when "less than 1 day"
        min_days, max_days=0, 1
      when "in resort"
        #TODO
        fail("TODO")
      when "more than 1 day past"
        min_days, max_days=-99999, -1
    end

    hash_arr.each do |var|
      if var["VisionBookingRef"] == nil
        break
      end
      if (var["Pre-In-Post"] >=min_days && var["Pre-In-Post"] <= max_days)
        matching_data<<var
        #puts var["Pre-In-Post"]
      end
    end
    matching_data
  end
end