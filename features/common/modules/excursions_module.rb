require_relative 'base_module'
module ExcursionsModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    def self.included(receiver)
      puts self.name+"::#{$g_platform}"
      receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    def click_excursions_link
      click_acc_label "Excurions_button"
    end

    def check_excursions_webview
      sleep 10
      query="webView css:'*' {textContent CONTAINS '#{@@side_panel_link}'}"
      assert_wait_for_element(query, 20)
    end

    module Eng
      def check_excursions_page
        verify_page_title @@excursions_title
        assert_wait_for_text @@experience_the_country
        assert_wait_for_text @@experience_the_country_subtitle
        assert_wait_for_text @@excursions_here_available
      end
    end
    module Nor
      def check_excursions_page
        verify_page_title @@excursions_title
      end
    end

    module Deu
      def check_excursions_page
        verify_page_title @@excursions_title
        assert_wait_for_text @@experience_the_country
      end
    end

  end

  module Tablet
    include BaseModule

    def self.included(receiver)
      puts self.name+"::#{$g_platform}"
      #receiver.send :include, Module.const_get(self.name+"::#{$g_platform}")
    end

    def check_excursions_page
      assert_wait_for_text "Excursions"
      assert_wait_for_text @@excursions_title
    end

    def check_excursion_mosaic
      puts "$g_booking.get_excursions #{$g_booking.get_excursions}"
      hash_arr= $g_booking.get_excursions
      arr=hash_arr.values[0]
      arr.each do |var|
        assert_text_present UnicodeUtils.upcase var
      end
    end
  end
end
