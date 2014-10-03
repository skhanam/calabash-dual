#!/bin/env ruby
# encoding: utf-8

# Holds booking data and provides method for accessing data
class Bookings
  #attr_accessor :user, :products, :destination

  def initialize
  end

  def get_countdown_destination
    $g_current_booking["payload"]["destination"]
  end

  def set_payload(payload=$g_current_booking["payload"],eng_checkList=$g_engChecklist)
    @payload=payload
    @destinations=@payload["destinationGuide"]
    @booking_summary= @payload["bookingSummary"]
    @products=@payload["products"]
    @weather=@payload["weather"]
    @eng_checkList=eng_checkList if $g_eng_app
  end

  def get_destination_countries
    countries=[]
    @destinations["data"].each do |var|
      countries<< var["destinationName"] if $g_nordics_app
      countries<< var[1]["destinationName"] if !$g_nordics_app
    end
    return countries
  end

  def get_country_names_for_weather
    arr=[]
    @weather["data"].each do |var|
      arr << var["name"]
    end
    return arr
  end

  def get_currency_details
    @fromCurrency=nil
    @ToCurrency1=nil
    @ToCurrency2=nil
    @fromCurrency=nil

    if $g_german_app
      @fromCurrency=@payload["currency"]["fromCurrency"]
      @ToCurrency1=@payload["currency"].keys[1]
      @ToCurrency2=@payload["currency"].keys[2]
    elsif $g_eng_app
      @fromCurrency=@payload["currency"]["fromCurrency"]
      @ToCurrency1=@payload["currencyCode"]
    end
    return @fromCurrency,@ToCurrency1,@ToCurrency2
  end

  def get_all_products_for_booking
    arr=[]
    products=@booking_summary["productDetails"]
    products.each do |var|
      arr<<var["productType"]
    end
    return arr
  end

  #param:
  # keyval - name of the key ex: bookingCode/ countdownStartDateAsUnixTime / leadPassenger  / otherPassengers
  def get_booking_summary(key_val)
    @booking_summary["overview"]["infoList"].each do |var|
      if var["key"]==key_val
        return var["title"], var["value"]
      end
    end
  end

  def get_booking_ref_number
    num = @payload["reservationCode"] if $g_german_app
    num = $g_current_booking[:valid][:VisionBookingRef] if $g_eng_app
    num = $g_current_booking[:valid][:bookingnumber] if $g_nordics_app
    return num
  end

  def find_number_of_flights
    if $g_eng_app
      return @products["flight"].count
    elsif $g_nordics_app
      count=0
      @products.each do |var|
        var["flights"].each do
          count+=1
        end
        return count
      end
    else
      res=get_all_products_for_booking
      return res.count "flight"
    end
  end

  def find_flight_details_for_booking(num)
    count=0
    @booking_summary["productDetails"].each do |var|
      count+=1 if var["productType"]=="flight"
      return var if count==num
    end
  end

  def get_countdown_days
    if $g_nordics_app
      return ((@payload["countdown"]["startDateTimeAsUnixTime"]-Time.now.utc.to_i)/(24*60*60).to_i)
    elsif $g_german_app
      countdown=0
      @payload["bookingSummary"]["overview"]["infoList"].each do |var|
        countdown=var["value"] if var["title"]=="Countdown"
      end
      days= ((countdown.to_i-Time.now.utc.to_i)/(24*60*60).to_i).to_s
      puts "days = #{days}"
      return days
    elsif $g_eng_app
      date_string = $g_current_user_details[:valid][:departuredate]+" "+$g_current_user_details[:valid][:DepartureTime]
      days_left=(DateTime.strptime(date_string, '%d-%m-%Y %H:%M') - DateTime.now).to_i
      puts "days_left #{days_left}"
      return days_left
    else
      fail "Unknown APP"
    end
  end

  def find_de_products(product)
    products=[]
    all_products=@booking_summary["productDetails"]
    all_products.each do |var|
      products<<var if var["productType"]==product
    end
    return products
  end

  def find_hotel_details(num)
    puts caller.first
    count=0
    find_de_products("hotel").each do |item|
      count+=1
      return item if count==num.to_i
    end
    return nil
  end


  def get_hotel_details
    arr=[]
    #eng app
    if ($g_eng_app)
      arr.push @payload["products"]["hotel"]["subTitle"]
      #nor user
    elsif ($g_nordics_app)
      @booking_summary["productDetails"].each do |var|
        arr.push(var["hotel"]["name"]) if var["hotel"]!=nil
      end
    elsif $g_german_app
      prod=find_de_products("hotel")
      prod.each do |var|
        arr.push(var["name"])
      end
    end

    return arr
  end

  def get_flights_details
    arr=[]
    temp={}

    #eng app
    if ($g_eng_app)
      @payload["flight"].each do |var|
        puts var["DepartureAirportCode"]
        temp["departureAirportCode"]=var["DepartureAirportCode"]
        temp["departureAirportName"]=var["DepartureAirportName"]
        temp["arrivalAirportCode"]=var["ArrivalAirportCode"]
        temp["arrivalAirportName"]=var["ArrivalAirportName"]
        arr.push(temp)
        #puts "temp #{temp}"
      end

      #nor user
    elsif ($g_nordics_app)
      @booking_summary["productDetails"].each do |val|
        arr.push(val["flight"]) if val.keys.include? "flight"
      end

    elsif $g_german_app
      arr=find_de_products("flight")
    end

    return arr
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


  def get_insurance_details
    puts find_de_products("insurance")
    fail "failed"
  end

  def get_checklist_count
    @eng_checkList["payload"]["itemList"].count
  end

  def get_checklist_items
    @eng_checkList["payload"]["itemList"].count
  end

end

def get_excursions
  cmd=%Q{curl 'http://37.46.24.155:3001/reservation/test0012/excursions' -H 'tui-public-key: abcd'  -H 'tui-tablet: true' -H 'Accept: */*' -H 'tui-screen-height: 768' -H 'tui-auth-key: PHPSESSID=ugqb6vgb1h6tf43ln296ubahu6; path=/' -H 'Connection: keep-alive' -H 'tui-screen-width: 1024' -H 'tui-handshake: 00935223ec4873d8d8bcc73ec964079b44bf846e' --compressed}
  res=JSON.parse(`#{cmd}`)
  @payload=res["payload"]

  arr=@payload["destinationAreaExcursions"]
  arr.each do |var|
    puts var["destinationName"]
    var["excursions"].each do |arg|
      puts arg["reservationCode"]
      puts arg["infoList"][0]["value"]
    end
  end
end