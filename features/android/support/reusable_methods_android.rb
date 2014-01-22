require 'rubyXL'
require_relative '../../support/application_strings'
require_relative '../../support/reusable_methods'

#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here
module AndroidReusableMethods
  include AppStrings
  include ReusableMethods

  def ti_enter_details(text, index)
    query("all TiEditText index:#{index}", setText: "#{text}")
    sleep(0.5)
  end

  def check_text_in_view(txt)
    begin
      return performAction('wait_for_text', txt, 2)["success"]
    rescue
      return false
    end
  end

  #Using this for acc label
  def wait_for_page_to_load(text, time_out)
    begin
      wait_poll({:until_exists => $g_query_txt+"contentDescription:'#{text}.'", :timeout => time_out}) do
        puts "wait_for_page_to_load: checking text #{text}"
      end
    rescue
      return false
    end
    return true
  end


  #Read and Enter data from excel sheet
  def enter_credentials_from_excel(test_data)
    await
    surname=test_data["Surname"]
    touch("all TiEditText index:1")

    enter_details(surname, 1)

    if (`adb shell getprop ro.build.version.release`.strip.match(/2.3/))
      $g_ginger_bread=true
    end

    enter_date(test_data["DepartureDate"])
    touch("all TiEditText index:5")
    ti_enter_details(test_data["VisionShopNumber"], 5)
    touch("all TiEditText index:7")
    ti_enter_details(test_data["VisionBookingRef"], 7)
    sleep(1)
    performAction('send_key_enter')
    sleep(1)
    performAction("go_back")

    if ($g_ginger_bread==true)
      sleep(1)
      performAction("scroll_up") #Scroll up for small screen devices
    end
  end

  def scroll_view(dir)
    if (dir=="up")
      performAction('drag', 50, 50, 70, 90, 10)
    elsif (dir=="down")
      performAction('drag', 50, 50, 90, 70, 10)
    end
  end

  # scroll in specified direction till id is found
    def scroll_page_till_text_found(id, dir)
    count=0
    while (count < 10)
      if (element_exists("* contentDescription:'#{id}.'") || element_exists("* text:'#{id}'"))
        break
      end
      count+=1
      scroll_view(dir)
      sleep 1
    end
  end

  # touch id specified and wait for text to appear
  def touch_and_verify(id, text)
    sleep 1
    if element_exists("* marked:'#{id}'")
      touch("* marked:'#{id}'")
    elsif  element_exists("* contentDescription:'#{id}.'")
      touch("* contentDescription:'#{id}.'")
    else
      fail("id:#{id} not found")
    end
    wait_for_text_to_appear_view(text, 10)
  end


  def swipe_dir(dir)
    if dir=="right"
    elsif dir=="left"
    end

  end

  def scroll_side_panel(text)
  end

end
