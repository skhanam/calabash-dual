require_relative 'base_module'
module CountdownModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def check_countdown_message
    sleep 2
    @@countdown_message_from_screen=get_acc_label_text("slogan_text")
    res=@@countdown_message_from_screen.match(@@countdown_countdown_message2)
    fail("countdown message is wrong #{@@countdown_message_from_screen}  #{@@countdown_countdown_message2} ") if res==nil
  end


  module EnNor

  end

  module Phone
    def check_count_down_page
      check_countdown_screen_title
      check_countdown_message
      sleep 1
      assert_text_elements([@@countdown_days_text, @@countdown_hours_text,
                            @@countdown_minutes_text, @@countdown_seconds_text])
      assert_text_present @@countdown_share_button_text #TODO check if its only for germany
      if @@countdown_message_from_screen.match(/#{@@countdown_countdown_message1}/)==nil &&
          @@countdown_message_from_screen.match(/#{@@countdown_countdown_message2}/)==nil
        fail ("expected:#{@@countdown_countdown_message}: actual text:#{@@countdown_message_from_screen}")
      end
    end
  end

  module Tablet
    include BaseModule

    def check_count_down_page
      flag=false
      assert_text_present @@countdown_days_text
      assert_text_present @@countdown_hours_text
      assert_text_present @@countdown_minutes_text
      assert_text_present @@countdown_seconds_text

      assert_text_present @@countdown_share_button_text

      sleep 1

      query("view", :text).each do |var|
        next if var==nil
        flag=true if var.match(/#{@@countdown_countdown_message2}/)!=nil
      end

      fail "#{@@countdown_countdown_message2} text found" if flag!=true
      assert_element "view text:'#{$g_booking.get_countdown_days}'"
    end
  end
end
