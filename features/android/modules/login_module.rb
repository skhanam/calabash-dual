require_relative '../../common/modules/base_module'

module LoginModule
  include BaseModule

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
        touch "* text:'Deutschland'" if $g_phone # this is not needed for tablet
        sleep 5
        res=query("CheckedTextView", :text)
        index=res.index(country)
        puts "setCountry #{res} index #{index}"
        touch "CheckedTextView index:#{index}"
        sleep 1
      end
    end

  module Phone
  end

  module Tablet
  end
end
