require_relative '../../common/modules/base_module'

module LoginModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Deu
    def enter_valid_user_name
      ti_enter_details($g_user_details[:username], 1)
      return $g_user_details[:username]
    end

    def enter_credentials(username, password)
      ti_enter_details(username, 2)
      ti_enter_details(password, 4)
    end

    def setCountry(country)
      sleep 2
      #if $g_phone # not needed for phone anymore
      #  touch "* text:'Deutschland'" # this is not needed for tablet
      #  sleep 5
      #end
      res=query("CheckedTextView", :text)
      index=res.index(country)
      puts "setCountry #{res} index #{index}"

      touch "CheckedTextView index:#{index}"
      sleep 1
    end
  end

  module Phone
    def check_input_elements
      assert_text_present "Benutzername / E-Mail eingeben" #@@email_hint_text
      assert_text_present @@login_password_hint
      assert_text_present @@login_default_country
    end
  end

  module Tablet
    def verify_fc_user_in_thomson
      txt="Sorry, this app isn’t available with your booking, but you can still manage your holiday using the MyFirstChoice app."
      assert_wait_for_text(escape_quotes(txt))
      assert_text_present @@welcome_help_cant_login_iosStore
    end
  end
end
