require_relative 'base_module'
module DestinationsModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end


  module Phone
    include BaseModule

    def check_dest_info_screen_title
      verify_page_title(@@destination_title)
    end

    def verify_destination_screen
      scroll_page_and_assert_text @@destination_share_facebook
      scroll_page_and_assert_text @@destination_page_gen_info
      scroll_page_and_assert_text @@destination_page_location
    end


    def verify_destination_info_screen
      verify_page_title @@destination_title
    end


  end

  module Tablet
    include BaseModule
    def verify_destination_page
      var=$g_booking.de_destination_details(0)
      var["infoSections"].each {
          |var| puts var["texts"].each {
            |val|
          scroll_assert_txt_webview val["title"]
        }
      }
    end
  end
end
