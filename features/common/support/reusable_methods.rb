# encoding: utf-8
#require 'rubyXL'
require 'date'
require_relative '../strings/application_strings'
require "unicode_utils/upcase"

#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module ReusableMethods
  include AppStrings

  def embed(a, b, c)
  end

  def input_text(var,id=nil)
    sleep 1
    enter_text_android(var,id) if $g_android
    keyboard_enter_text var if $g_ios
    sleep 1
  end

  # escape if there are + symbols in text
  def escape_plus(str)
    if str.include? '+'
      str.gsub('+', '\\\\+')
    end
    return str
  end

  def get_localized_capitalized_string(id)
    UnicodeUtils.upcase(get_localized_string(id))
  end

  #Send resource id for string and get localized value
  def get_localized_string(id)
    $g_localized_strings||=read_xml($g_lang_strings_file)
    if $g_localized_strings[id]==nil
      puts("id #{id} string not found")
      fail("id #{id} string not found")
    end
    return $g_localized_strings[id]
  end

  def capitalize_first_letter_of_each_word txt
    txt.split.each { |i| i.capitalize! }.join(' ')
  end

  def convert_excel_date_to_str(date_int)
    d=DateTime.new(1899, 12, 30) + date_int.to_i
    return d.strftime("%d-%b-%Y")
  end

  def write_welcome_messages_to_file(txt)
    if $g_write_to_file==true
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

  def write_verified_text_to_file(txt)
    if (ENV['LOG_VERIFIED_TXT']=="yes")
      begin
        filename = File.open($g_verified_strings, "a")
        filename.write("#{txt}\n")
      rescue IOError => e
        fail("Write to file failed")
      ensure
        filename.close unless filename == nil
      end
    end
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

  #Read language strings by default or else read specified file
  # $g_language_strings is set in env.rb based on command line argument TESTENV (from cucumber profile)
  def read_xml(filename=$g_language_strings)
    filename = $g_lang_strings_file
    all_strings_hash={}

    config = XmlSimple.xml_in(filename, {'KeyAttr' => 'resources/String'})
    config['string'].each do |var|
      all_strings_hash[var["name"]]=var["content"]
    end

    return all_strings_hash
  end

  def split_to_digits(arg)
    div=10
    digit=0
    arr=[]
    while (arg>=10)
      digit=arg%div
      arg=arg/10
      arr.push digit
    end
    arr.push arg
    return arr.reverse
  end

  #unused
  def read_string_from_excel
    #string_locale="DE"
    #if $g_localized_strings == nil
    #  puts "readings strings for first time"
    #  file_path=$g_strings
    #  workbook ||= RubyXL::Parser.parse(file_path)
    #  $g_localized_strings||=workbook[0].get_table[:table]
    #end
    #$g_localized_strings.find { |a| return a[string_locale] if a["resource_id"]==id }
  end

end



