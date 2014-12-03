require_relative 'base_module'
#require_relative '../../common/support/common_methods'

module FlightsModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end


  module Phone

    def self.included(receiver)
      puts self.name+"::#{$g_lang_mod}"
      receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    module Eng
      include BaseModule

      def check_flight_biscuit
        var=$g_booking.get_home_biscuits("flight")
        assert_wait_for_text @@your_flight

        flight_data=var[0]
        sleep 1
        assert_wait_for_text flight_data["DepartureAirportCode"]
        assert_text_present flight_data["DepartureAirportName"]
        assert_text_present flight_data["ArrivalAirportCode"]
        assert_text_present flight_data["ArrivalAirportName"]
        @travel_date = DateTime.parse(flight_data["DepartureDate"]).strftime "%a %0d %b %Y" #  exp Wed 14 Oct 2015
        assert_partial_text @travel_date
      end

    end

    module Nor
      include BaseModule

      def check_flight_biscuit
        var=$g_booking.get_home_biscuits("flight")
        assert_wait_for_text @@your_flight

        flight_data=var[0]
        sleep 1
        assert_wait_for_text flight_data["DepartureAirportCode"]
        assert_text_present flight_data["DepartureAirportName"]
        assert_text_present flight_data["ArrivalAirportCode"]
        assert_text_present flight_data["ArrivalAirportName"]
        @travel_date = DateTime.parse(flight_data["DepartureDate"]).strftime "%a %0d %B %Y"
        assert_partial_text @travel_date
      end

    end
    module Deu
      include BaseModule

      def check_flight_biscuit
        var=$g_booking.get_home_biscuits("flight")
        assert_wait_for_text @@your_flight

        flight_data=var[0]
        sleep 1
        assert_wait_for_text flight_data["departureAirportCode"]
        assert_text_present flight_data["departureAirportName"]
        assert_text_present flight_data["arrivalAirportCode"]
        assert_text_present flight_data["arrivalAirportName"]
        @travel_date = DateTime.parse(flight_data["departureDateTime"]).strftime "%0d. %B %Y"
        assert_partial_text @travel_date
      end
    end
  end

  module Tablet
    include BaseModule

    def self.included(receiver)
      puts self.name+"::#{$g_lang_mod}"
      receiver.send :include, Module.const_get(self.name+"::#{$g_lang_mod}")
    end

    module Eng
      def check_flight_biscuit
        var=$g_booking.get_home_biscuits("flight")
        flight_data=var["data"][0]
        sleep 1
        assert_wait_for_text flight_data["DepartureAirportCode"]
        assert_text_present flight_data["DepartureAirportName"]
        assert_text_present flight_data["ArrivalAirportCode"]
        assert_text_present flight_data["ArrivalAirportName"]
        day_num=(DateTime.parse(flight_data["DepartureDate"]).strftime "%-d").to_i
        day_suffix=CommonMethods.new.get_day_number_suffix day_num
        @travel_date = DateTime.parse(flight_data["DepartureDate"]).strftime "%A, %-d#{day_suffix} %B %Y" if $g_eng_app
        assert_partial_text @travel_date
      end
    end

    module Deu
      def check_flight_biscuit
        var=$g_booking.get_home_biscuits("flight")
        flight_data=var["data"][0]
        sleep 1
        assert_wait_for_text flight_data["departureAirportCode"]
        assert_text_present flight_data["departureAirportName"]
        assert_text_present flight_data["arrivalAirportCode"]
        assert_text_present flight_data["arrivalAirportName"]
        @travel_date = DateTime.parse(flight_data["departureDateTime"]).strftime "%A, %0d. %B %Y"
        puts @travel_date
        assert_partial_text @travel_date
      end
    end

  end
end
