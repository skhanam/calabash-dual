require_relative '../Default/side_panel'

class SidePanelNor < SidePanel

  def verify_side_panel_strings
    scroll_side_panel_and_assert @@home
    scroll_side_panel_and_assert @@holiday_summary
    scroll_side_panel_and_assert @@side_panel_countdown
    scroll_side_panel_and_assert @@weather
    begin
      scroll_side_panel_and_assert @@flight
    rescue
      scroll_side_panel_and_assert @@flights
    end
    scroll_side_panel_and_assert @@accomadation
    scroll_side_panel_and_assert @@destination
    scroll_side_panel_and_assert @@duty_free

    scroll_side_panel_and_assert @@guide_online
    scroll_side_panel_and_assert @@app_feed_back
    scroll_side_panel_and_assert @@side_panel_contact_us
    scroll_side_panel_and_assert @@logout
    # excursion

  end

  def check_sidepanel_based_on_bookings
    #Holiday extras
    #excursions
  end
end
