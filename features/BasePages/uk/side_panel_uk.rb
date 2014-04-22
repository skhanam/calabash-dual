require_relative '../Default/side_panel'

class SidePanelEng < SidePanel

  def verify_side_panel_strings
    scroll_side_panel_and_assert @@home
    scroll_side_panel_and_assert @@holiday_summary
    scroll_side_panel_and_assert @@side_panel_countdown
    begin
      scroll_side_panel_and_assert @@holiday_checklist
    rescue
      scroll_side_panel_and_assert @@holiday_checklists
    end
    scroll_side_panel_and_assert @@weather
    begin
      scroll_side_panel_and_assert @@flight
    rescue
      scroll_side_panel_and_assert @@flights
    end
    scroll_side_panel_and_assert @@hotel_and_resort
    scroll_side_panel_and_assert @@destination
    scroll_side_panel_and_assert @@getting_to_the_airport
    scroll_side_panel_and_assert @@holiday_extras
    scroll_side_panel_and_assert @@app_feedback
    scroll_side_panel_and_assert @@travel_money
    scroll_side_panel_and_assert @@important_information
    scroll_side_panel_and_assert @@app_feedback
    scroll_side_panel_and_assert @@side_panel_contact_us
    check_sidepanel_based_on_bookings
    scroll_side_panel_and_assert @@logout
  end

  def check_sidepanel_based_on_bookings

    if($g_ENG_USER_DETAILS["payload"]["excursions"]["numberOfExcursions"].to_i > 0)
      scroll_side_panel_and_assert @@excursions
    end
  end


end
