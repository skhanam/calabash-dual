require 'rubyXL'
require_relative '../../ios/base_page_ios' if $g_ios
require_relative '../../android/base_page_android' if $g_android

#Methods common across android and ios are added here
class CommonMethods < BasePage
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

      puts "min_days, max_days #{min_days}, #{max_days}"
      if (var["Pre-In-Post"] >=min_days && var["Pre-In-Post"] <= max_days)
        matching_data<<var
        #puts var["Pre-In-Post"]
      end
    end
    matching_data

  end

  #Avoid calling this method directly
  def get_user_details(url)
    username=USERS[:valid][:username]
    password=USERS[:valid][:password]
    query_url=url||'http://37.46.24.155:3000/reservations'
    server_url="http://37.46.24.155:3000/login"
    res1=res1||`curl --data "username=#{username}&password=#{password}" '#{server_url}'`

    m=res1.match('(PHP(.*)path=\/)')
    res=`curl --header 'tui-auth-key:#{m[1]}' #{query_url}`
    parsed=JSON.parse(res)
    return parsed
  end

  #specify the booking type and this method will return hash of booking details
  def get_booking_details(booking_type)
    case
      when booking_type=="typical_booking"
        booking_id=80522687
      when booking_type=="flight_booking"
        booking_id=75511407
      when booking_type=="insurance_booking"
        booking_id=38072949
      when booking_type=="car_rental_booking"
        booking_id=36739063
      when booking_type =="non_eu_booking"
        booking_id=80522737
    end
    query_url='http://37.46.24.155:3000/reservation/'+booking_id.to_s+'/home'
    res= get_user_details(query_url)
  end

  def get_booking_name
    $g_current_booking["payload"]["destination"]
  end

  def get_desination_countries(booking=$g_current_booking)
    countries=[]
    #puts booking
    booking["payload"]["destinationGuide"]["data"].each do |var|
      countries<< var[1]["destinationName"]
    end
    return countries
  end

  def get_all_products_for_booking
    arr=[]
    $g_current_booking["payload"]["bookingSummary"]["productDetails"].each do |var|
      arr<<var["productType"]
    end
    return arr
  end

  def get_booking_summary(key_val)
    #key_val=["leadPassenger","otherPassengers","bookingCode"]
    $g_current_booking["payload"]["bookingSummary"]["overview"]["infoList"].each do |var|
      if var["key"]==key_val
        return var["title"], var["value"]
      end
    end
  end

  def find_number_of_flights
    res=get_all_products_for_booking
    res.count "flight"
  end

  def find_flight_details_for_booking(num)
    count=0
    $g_current_booking["payload"]["bookingSummary"]["productDetails"].each do |var|
      count+=1 if var["productType"]=="flight"
      return var if count==num
    end
  end

  def get_countdown_days(val="typical_booking")
    ($g_current_booking["payload"]["countdown"]["startDateTimeAsUnixTime"]-Time.now.utc.to_i)/(24*60*60).to_i if val=="typical_booking"
  end

  def find_products_in_booking(product)
    products=[]
    all_products=$g_current_booking["payload"]["bookingSummary"]["productDetails"]
    all_products.each do |var|
      products<<var if var["productType"]==product
    end
    return products
  end


  def get_insurance_details
    puts find_products_in_booking("insurance")
    fail "failed"
  end

  def check_call_us_link
    click_call_button
    verify_call_button_overlay
  end

  def click_call_button
    scroll_page_till_partial_text @@services_phone
    click_on_partial_text @@services_phone
  end

  def verify_call_button_overlay
    sleep 1
    assert_text_elements([@@call_us_are_you_sure, @@call_us_dialog_yes,
                          @@call_us_dialog_no])
    wait_for_partial_text_shown @@call_us_dialog_number
    click_on_text @@call_us_dialog_no
    sleep 2
  end


  # scroll in specified direction till partial id is found
  def scroll_page_till_partial_text(text, dir="down", count=10)
    flag=0
    repeat_count=0
    while (repeat_count < count)
      repeat_count+=1
      if check_partial_text_shown(text)
        flag=1
        break
      end
      sleep 1
      puts "#{text} is not visible yet"
      scroll_view(dir)
    end
    sleep 2
    fail("text is not shown") if flag==0
  end


  # scroll in specified direction till partial id is found
  def scroll_page_till_acc(acc, dir="down", count=10)
    flag=0
    repeat_count=0
    while (repeat_count < count)
      repeat_count+=1
      if check_acc_label(acc)
        flag=1
        break
      end
      sleep 1
      scroll_view(dir)
    end

    fail("acc:#{acc}: not found") if flag==0
  end

  def check_sharing
    scroll_page_till_acc @@share_button_closed_img
    click_accessibility_label @@share_button_closed_img
    wait_for_acc_label @@facebook_share_img
    wait_for_acc_label @@twitter_share_img
    wait_for_acc_label @@share_button_open_img
    sleep 1
  end


end
