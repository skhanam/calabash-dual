class SidePanelEng < SidePanel

  def verify_side_panel_strings
    @@home=get_localized_string "home" #"Home"
    @@holiday_summary=get_localized_string "holiday_summary" #"Holiday summary"
    @@holiday_countdown=get_localized_string "holiday_countdown" #"Holiday countdown"
    @@holiday_checklist=get_localized_string "holiday_checklist" #"Holiday checklist"
    @@holiday_checklists=get_localized_string "holiday_checklists" #"Holiday checklists"
    @@weather=get_localized_string "weather" #"Weather"
    @@flight=get_localized_string "flight" #"Flight"
    @@flights=get_localized_string "flights" #"Flights"
    @@hotel_and_resort=get_localized_string "hotel_and_resort" #"Hotel and resort"
    @@destination=get_localized_string "destination" #"Destination"
    @@getting_to_the_airport=get_localized_string "getting_to_the_airport" #"Getting to the airport"
    @@travel_money=get_localized_string "travel_money" #"Travel money"
    @@important_information=get_localized_string "important_information" #"Important information"
    @@contact_us=get_localized_string "contact_us" #"Contact us"
    @@logout=get_localized_string "logout" #"Log out"
  end

  def check_sidepanel_based_on_bookings
    #Holiday extras
    #excursions
  end
end
