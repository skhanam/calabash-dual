#!/bin/env ruby
# encoding: utf-8

# Holds booking data and provides method for accessing data
class Bookings
  include eval($g_hw_module)
#attr_accessor :user, :products, :destination

  def initialize
  end

  def get_countdown_destination
    $g_current_booking["payload"]["destination"]
  end

  def set_payload(payload=$g_current_booking["payload"], eng_checkList=$g_engChecklist)
    @payload=payload
    @destinations=@payload["destinationGuide"]
    @booking_summary= @payload["bookingSummary"] if $g_phone
    @booking_summary= $g_summary["payload"] if $g_tablet
    @products=@payload["products"]
    @weather=@payload["weather"]
    @eng_checkList=eng_checkList if $g_eng_app
   # puts "#{@booking_summary}"

  end

  def get_destination_countries
    countries=[]
   # puts "@destinations #{@destinations}"
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
      @dest_payload = $g_destinations["payload"]
      @excursions_payload=$g_excursions["payload"]
    elsif $g_eng_app
      @fromCurrency=@payload["currency"]["fromCurrency"]
      @ToCurrency1=@payload["currencyCode"]
    end
    return @fromCurrency, @ToCurrency1, @ToCurrency2
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

  def de_destinations
    arr=[]
    @dest_payload["destinationInfoObjects"].each do |var|
      arr.push(var["destinationName"])
    end
    return arr
  end

  def de_destination_details(index=0)
    @dest_payload["destinationInfoObjects"][index]["destinationName"]
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
      puts "#{prod}"
      prod.each do |var|
        arr.push(var["infoList"][0]["value"])
      end
    end

    puts arr
    fail "here"
    return arr
  end

  def find_number_of_hotels
    return get_hotel_details.count
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

  def get_excursions
    puts "@excursions_payload #{@excursions_payload}"
    arr=@excursions_payload["destinationAreaExcursions"]
    hash_arr={}
    arr.each do |var|
      arr1=[]
      @reservation_code=nil
      puts var["destinationName"]
      var["excursions"].each do |arg|
        @reservation_code = arg["reservationCode"]
        arr1.push(arg["infoList"][0]["value"])
      end
      hash_arr["#{var["destinationName"]}"]= arr1
    end
    return hash_arr
  end

  def get_home_biscuits(name, num=1)
    fail if num <= 0
    count=0
    @payload["biscuits"].each do |var|
      if var["name"]==name
        count+=1
      end
      return var if count==num
    end
    fail "Mentioned biscuit is not found in home response"
  end

  def get_weather_data
    return $g_weather["payload"]["weatherStations"]
  end

end

module Tablet


  def en_get_passenger_details
    hash_arr={}
    arr1=[]
    arr2=[]
    @booking_summary["passengerCollection"].each do |var|
      name= "#{var["Title"]} #{var["Initial"]} #{var["Surname"]}"
      arr1.push(name) #if var["LeadBookerIndicator"]
      arr2.push(name) #if !var["LeadBookerIndicator"]
    end
    hash_arr["LeadPassenger"]=arr1
    hash_arr["OtherPassenger"]=arr2
    return hash_arr
  end

  def get_flight_details
    #res["flightCollection"].each {|var| puts var["DepartureAirportName"]+" to "+var["ArrivalAirportName"]}
    hash_arr={}
    arr1=[]
    arr2=[]
    @booking_summary["flightCollection"].each do |var|
      journey= "#{var["DepartureAirportName"]} to #{var["ArrivalAirportName"]}"
      arr1.push(journey)
      arr2.push(journey)
    end
    hash_arr["Departure"]=arr1
    hash_arr["Arrival"]=arr2
    return hash_arr
  end


end



module Phone

end
