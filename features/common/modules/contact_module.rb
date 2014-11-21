require_relative 'base_module'
module ContactModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    include BaseModule

    def contact_us_embed_page
      scroll_page_and_assert_text @@contact_us_first_name
      scroll_page_and_assert_text @@contact_us_last_name
      scroll_page_and_assert_text @@contact_us_email_id
      scroll_page_and_assert_text @@contact_us_telephone
      scroll_page_and_assert_text @@contact_us_subject
      scroll_page_and_assert_text @@contact_us_message
      scroll_page_and_assert_text @@contact_us_send_email
      scroll_page_and_assert_text @@contact_us_t_and_c
      scroll_page_and_assert_text @@contact_us_disclaimer
    end

  end

  module Tablet
    include BaseModule

    def check_contact_us_page


    end
  end
end
