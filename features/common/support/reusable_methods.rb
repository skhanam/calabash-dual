require 'rubyXL'
require 'date'
require_relative '../support/application_strings'
#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module ReusableMethods
  include AppStrings


  def embed(a, b, c)
  end

  def read_XML_into_hash_array(filename)
    xmlfile = File.new(filename)
    xmldoc = Document.new(xmlfile)

    xmldoc.elements.each('resources/string') do |ele|
      name=ele.attribute("name")
      value=ele.text
      @hasharr["#{name}"]=value
    end
    return @hasharr
  end

  def read_strings_from_file
    en_data="/Users/tejasvi.manmatha/projects/meine.tui/i18n/en/strings.xml"
    @hasharr=read_XML_into_hash_array(en_data)
  end

  def read_str(txt)
    puts "****read_str ******* #{txt}"
    return @hasharr["#{txt}"]
  end

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


  def read_test_data()
    file_path=$g_booking_data
    puts file_path
    workbook = RubyXL::Parser.parse(file_path)
    hash_arr=workbook[1].get_table(["Surname", "Today", "Pre-In-Post", "DepartureDate", "DepartureTime", "ReturnDate", "VisionShopNumber", "VisionBookingRef", "EmailAddress", "HotelName", "ResortName", "DestinationName", "BookingDate", "UnitBar", "IsFamily", "ReturnedFromHoliday", "IsThomsonFlight", "Channel", "ProductName", "DurationNightsInHotel", "Return-Dep Date"])
    # "Surname", "Today", "Pre-In-Post", "departuredate", "VisionShopNumber", "VisionBookingRef", "EmailAddress", "HotelName", "ResortName", "DestinationName", "BookingDate", "UnitBar", "IsFamily", "ReturnedFromHoliday", "IsThomsonFlight", "Channel"])
    return hash_arr[:table]
  end

  def convert_excel_date_to_str(date_int)
    d=DateTime.new(1899, 12, 30) + date_int.to_i
    return d.strftime("%d-%b-%Y")
  end

  def write_welcome_messages_to_file(txt)
    if ($g_write_to_file==true)
      begin
        filename = File.open($g_messages_file, "a")
        filename.write("#{txt}\n")
      rescue IOError => e
        fail("Write to file failed")
      ensure
        filename.close unless filename == nil
      end
    end
  end



  def assert_element_exists(element)
    res = element_exists($g_query_txt+"text:'#{element}'")
    if not res
      screenshot_and_raise "No element found with mark or text: #{element}"
    end
    return res
  end

  def wait_for_seconds(timetowait)
    sleep(timetowait)
  end

  #Create result hash for data matching criteria  @@welcome_msg_hash[criteria]
  def create_result_hash(criteria)
    @@result_hash={}
    @@welcome_msg_hash[criteria].each do |message|
      @@result_hash[message]=0
    end
    return @@result_hash
  end

#Return current date
  def get_current_time
    Time.now()
  end

  #Add days to current date
  def add_days(count)
    24*60*60*count.to_i
  end

end
