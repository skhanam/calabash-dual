require 'rubyXL'

#Methods common across android and ios are added here
module CommonMethods
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
    username="peterpan"
    password="testtest"
    query_url=url||'http://37.46.24.155:3000/reservations'
    server_url="http://37.46.24.155:3000/login"
    res1=res1||`curl --data "username=#{username}&password=#{password}" '#{server_url}'`

    m=res1.match('(PHP(.*)path=\/)')
    res=res||`curl --header 'tui-auth-key:#{m[1]}' #{query_url}`
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
    end

    query_url='http://37.46.24.155:3000/reservation/'+booking_id.to_s+'/home'
    res= get_user_details(query_url)
  end

  def get_typical_booking_name
    TYPICAL_BOOKING["payload"]["destination"]
  end

  def get_countdown_days(val="typical_booking")
    (TYPICAL_BOOKING["payload"]["countdown"]["startDateTimeAsUnixTime"]-Time.now.utc.to_i)/(24*60*60).to_i if val=="typical_booking"
  end

  def find_products(product)
    products=[]
    all_products=TYPICAL_BOOKING["payload"]["bookingSummary"]["productDetails"]
    all_products.each do |var|
      products<<var if var["productType"]==product
    end
    return products
  end

end
