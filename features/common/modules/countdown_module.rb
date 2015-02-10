require_relative 'base_module'
module CountdownModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    include BaseModule

    def check_i_am_off_message
      sleep 1
      if $g_ios
        res=query("view marked:'slogan_text'", :text).first.match(@@countdown_countdown_message2)
      elsif $g_android
        res=query("* marked:'slogan_text.'", :text).first
      end
      puts res
      puts "checking for #{@@countdown_countdown_message1}"
      fail("I am off message is not present") if res==nil
    end

    def check_count_down_page
      check_countdown_screen_title
      check_i_am_off_message
      sleep 1
      check_text_elements
      @@countdown_message_from_screen=get_acc_label_text("slogan_text")
      assert_text_present @@countdown_share_button_text #TODO check if its only for germany
      if @@countdown_message_from_screen.match(/#{@@countdown_countdown_message1}/)==nil &&
          @@countdown_message_from_screen.match(/#{@@countdown_countdown_message2}/)==nil
        fail ("expected:#{@@countdown_countdown_message}: actual text:#{@@countdown_message_from_screen}")
      end
    end

    def check_sharing_options
      if !$g_nordics_app  # sharing options open in nordics hence removed verification
        click_on_text @@countdown_share_button_text
        assert_wait_for_acc @@facebook_share_img
        assert_wait_for_acc @@twitter_share_img
      end
    end

  end

  module Tablet
    include BaseModule

    #def self.included(receiver)
    #  puts self.name+"::#{$g_platform}"
    #  receiver.send :include, Module.const_get(self.name+"::#{$g_platform}")
    #end

    def check_count_down_page
      flag=false
      check_text_elements
      assert_text_present @@countdown_share_button_text
      sleep 1

      query("view", :text).each do |var|
        next if var==nil
        flag=true if var.match(/#{@@countdown_countdown_message2}/)!=nil
      end

      query("ti.modules.titanium.ui.widget.TiUILabel$1",:text).each do |var|
        next if var==nil
        puts ":#{@@countdown_countdown_message2}:#{var}:"
        flag=true if var.match(/#{@@countdown_countdown_message2}/)!=nil
      end

      fail "#{@@countdown_countdown_message2} text found" if flag!=true
      assert_element "view text:'#{$g_booking.get_countdown_days}'"
    end

    def check_i_am_off_message
      txt=@@countdown_countdown_message1.gsub(/\[location\]/, $g_booking.get_countdown_destination)
      puts txt
      assert_wait_for_text txt
    end

    def check_sharing_options
      click_acc_label @@share_button_closed_img
      assert_wait_for_acc @@share_button_open_img
      assert_wait_for_acc @@facebook_share_img
      assert_wait_for_acc @@twitter_share_img
    end

  end
end
