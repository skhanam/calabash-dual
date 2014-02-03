class NewTOTUIBasePage < BasePage

  #def initialize
  #end

  def check_new_to_tui_screen
    assert_wait_for_text(@@new_to_tui_discover_tui)

  end

  def check_new_to_tui_page
    check_new_to_tui_screen
    assert_text_elements([@@new_to_tui_discover_tui, @@new_to_tui_havent_booked,
                          @@new_to_tui_travel_worlds])
    assert_text_present @@new_to_tui_video
    scroll_page_and_assert_text(@@new_to_tui_classic_hotel)

    assert_text_elements([@@new_to_tui_text2, @@new_to_tui_classic_hotel])

  end

  def check_new_to_tui_video
    scroll_page_and_assert_text(@@new_to_tui_discover_tui, "up")
    click_on_text(@@new_to_tui_video)
    assert_wait_for_acc_label("Track position")
    assert_wait_for_acc_label("0:02")
    touch("button marked:'Done'")
    assert_wait_for_text(@@new_to_tui_discover_tui)
  end
end
