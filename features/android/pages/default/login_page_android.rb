require 'calabash-android/abase'
require_relative 'base_page_android'

class LoginBasePage < BasePage

  def trait
    "* marked:'#{@@login_page_text}'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end


  #Read and Enter data from excel sheet
  def enter_credentials_from_excel(test_data)
    await
    surname=test_data["Surname"]
    touch("all TiEditText index:1")

    enter_details(surname, 1)
    touch("all TiEditText index:3")
    enter_date(test_data["departuredate"])
    touch("all TiEditText index:5")
    enter_details(test_data["VisionShopNumber"], 5)
    touch("all TiEditText index:7")
    enter_details(test_data["VisionBookingRef"], 7)
    sleep(1)
    touch("all TiEditText index:1")
    sleep(1)
    performAction("go_back")
  end

  def enter_details(text, index)
    query("all TiEditText index:#{index}", setText: "#{text}")
    sleep(0.5)
  end

  def enter_date(date_int)

    day, month, year=convert_excel_date_to_str(date_int).split(/-/)
    puts day, month, year
    sleep(1)

    #Commented code is useful to set date in nexus4 (OS 4.3)
    #puts "#{day}#{getDayNumberSuffix(day)} #{month} #{year}"
    #query("all TiEditText index:3", setText: "#{day}#{getDayNumberSuffix(day)} #{month} #{year}")

    #Set date
    while (query("* id:'numberpicker_input' index:0", :text)[0].to_i != day.to_i)
      sleep(0.5)
      if query("* id:'numberpicker_input' index:0", :text)[0].to_i > day.to_i
        print "decrease day"
        touch("* contentDescription:'Decrease day'")
      elsif query("* id:'numberpicker_input' index:0", :text)[0].to_i < day.to_i
        print "increase day"
        touch("* contentDescription:'Increase day'")
      end
    end

    #Set Month
    while (query("* id:'numberpicker_input' index:1", :text)[0].to_s != month)
      sleep(0.5)
      touch("* contentDescription:'Decrease month'")
    end

#Set year
    while (query("* id:'numberpicker_input' index:2", :text)[0].to_i != year.to_i)
      sleep(0.25)
      if query("* id:'numberpicker_input' index:2", :text)[0].to_i > year.to_i
        print "decrease year"
        touch("* contentDescription:'Decrease year'")
      elsif query("* id:'numberpicker_input' index:2", :text)[0].to_i < year.to_i
        print "increase year"
        touch("* contentDescription:'Increase year'")
      end
    end
    sleep(1)
    touch("button text:'Set'")
    sleep(1)
  end


  def getDayNumberSuffix(day)
    day=day.to_i
    if (day >= 11 && day <= 13)
      return "th";
    end

    case day%10
      when 1
        return "st"
      when 2
        return "nd"
      when 3
        return "rd"
      else
        return "th"
    end
  end

end