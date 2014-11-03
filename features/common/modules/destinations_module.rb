require_relative 'base_module'
module DestinationsModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def verify_destination_screen
    scroll_page_and_assert_text @@destination_share_facebook
    scroll_page_and_assert_text @@destination_page_location
    scroll_page_and_assert_text @@destination_page_gen_info
  end

  def verify_destination_info_screen
    verify_page_title @@destination_title
  end

  def verify_list_of_destinations
    @countries= $g_booking.get_destination_countries
    screenshot(options={:name => "destinations"}) if ENV['TAKE_SS']=="yes"
    @countries.each do |var|
      puts "checking destination name #{var}"
      scroll_home_biscuits var
    end
  end

  def check_each_destination
    @countries= $g_booking.get_destination_countries
    @countries.each do |var|
      puts "checking destination name #{var}"
      click_on_text var
      verify_page_title @@destination_title
      scroll_page_and_assert_text @@destination_page_gen_info
      scroll_page_and_assert_text @@destination_page_location
      navigate_back
      sleep 2
    end
  end

  module Phone
    include BaseModule

    def check_dest_info_screen_title
      verify_page_title(@@destination_title)
    end

  end

  module Tablet
    include BaseModule

  end
end
