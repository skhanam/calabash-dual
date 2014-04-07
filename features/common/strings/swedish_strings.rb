# encoding: UTF-8

module SwedishStrings
  def set_swedish_strings
    puts "settings set_swedish_strings"
    login_page_strings
  end

  def login_page_strings
    @@login_page_text = get_localized_string "welcome_login_header"
    @@welcome_login_surname=get_localized_string "welcome_login_surname" #"Surname of lead passenger:"
    @@welcome_login_departure_date=get_localized_string "welcome_login_departure_date" #"Departure date:"
    @@welcome_login_booking_reference_extra=get_localized_string "welcome_login_booking_reference_extra" #"welcome_login_booking_reference_extra"
    @@login_button=get_localized_string "welcome_login_cta_login" #"Log in"
    @@welcome_help_cant_login_cta=get_localized_string "welcome_help_cant_login_cta" #"Retrieve a booking reference number"
    @@welcome_cta_help_login=get_localized_string "welcome_cta_help_login" #"Help logging in"

    @@login_error_text=get_localized_string "welcome_login_credential_error"
    @@login_error_booking_ref=get_localized_string "welcome_login_booking_reference_extra"
    @@login_error_departure_date=get_localized_string "welcome_login_departure_date_extra"
    @@login_error_surname=get_localized_string "welcome_login_surname_extra"
  end
end


