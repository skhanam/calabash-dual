#read from  brand-ntc-ios/features/strings/languagefolder/file
def read_copy_from_user_details(arg1)
  filename =$g_user_details
#    my_log(arg1 +" " +filename, 5)
  properties = {}
  File.open(filename, 'r') do |properties_file|
    properties_file.read.each_line do |line|
      line.strip!
      if (line[0] != ?# and line[0] != ?=)
        i = line.index('=')
        if (i)
          properties[line[0..i - 1].strip] = line[i + 1..-1].strip
        else
          properties[line] = ''
        end
      end
    end
    return properties[arg1]
  end
end

# Read all data from excel and filter them by matching criteria
def check_data_from_excel_matching_criteria(criteria)
  #TODO unused remove
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

def read_test_data
  #TODO remove unused
  file_path=$g_booking_data
  puts file_path
  workbook = RubyXL::Parser.parse(file_path)
  hash_arr=workbook[1].get_table(["Surname", "Today", "Pre-In-Post", "DepartureDate", "DepartureTime", "ReturnDate", "VisionShopNumber", "VisionBookingRef", "EmailAddress", "HotelName", "ResortName", "DestinationName", "BookingDate", "UnitBar", "IsFamily", "ReturnedFromHoliday", "IsThomsonFlight", "Channel", "ProductName", "DurationNightsInHotel", "Return-Dep Date"])
  return hash_arr[:table]
end

