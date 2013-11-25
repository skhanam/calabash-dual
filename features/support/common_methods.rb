require 'rubyXL'

module CommonMethods

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

  def read_test_data()
    file_path=$g_booking_data
    puts file_path
    workbook = RubyXL::Parser.parse(file_path)
    hash_arr=workbook[1].get_table(["Surname", "Today", "Pre-In-Post", "departuredate", "VisionShopNumber", "VisionBookingRef", "EmailAddress", "HotelName", "ResortName", "DestinationName", "BookingDate", "UnitBar", "IsFamily", "ReturnedFromHoliday", "IsThomsonFlight", "Channel"])
    return hash_arr[:table]
  end

  def convert_excel_date_to_str(date_int)
    d=DateTime.new(1899, 12, 30) + date_int.to_i
   return d.strftime("%d-%b-%Y")
  end

  def write_welcome_messages_to_file(txt)
    if ($g_write_to_file==true)
      begin
        filename = File.open("features/dump/welcome_messages.txt", "a")
        filename.write(txt+"\n")
      rescue IOError => e
        fail("Write to file failed")
      ensure
        filename.close unless filename == nil
      end
    end
  end

end
