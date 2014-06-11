require_relative '../Default/side_panel'

class SidePanelNor < SidePanel

  def verify_side_panel_strings
    scroll_side_panel_and_assert @@home
    scroll_side_panel_and_assert @@side_panel_booking_summary
    scroll_side_panel_and_assert @@side_panel_countdown
    scroll_side_panel_and_assert @@side_panel_weather
    begin
      scroll_side_panel_and_assert @@side_panel_flight
    rescue
      scroll_side_panel_and_assert @@side_panel_flights
    end
    scroll_side_panel_and_assert @@side_panel_hotel
    scroll_side_panel_and_assert @@destination
    scroll_side_panel_and_assert @@duty_free

    check_sidepanel_based_on_bookings
    scroll_side_panel_and_assert @@guide_online
    scroll_side_panel_and_assert @@app_feed_back
    scroll_side_panel_and_assert @@side_panel_contact_us
    scroll_side_panel_and_assert @@log_out_text
    # excursion

  end

end
