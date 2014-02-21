class NewTOTUIBasePage < BasePage

  def check_new_to_tui_screen_title
    assert_wait_for_text(@@new_to_tui_discover_tui)

  end

  def check_new_to_tui_page
    check_new_to_tui_screen_title
    assert_text_present @@new_to_tui_discover_tui
    assert_text_present @@new_to_tui_havent_booked
    assert_text_present @@new_to_tui_travel_worlds
    assert_text_present @@new_to_tui_video
    scroll_page_and_assert_text(@@new_to_tui_classic_hotel)

    assert_text_elements([@@new_to_tui_text2, @@new_to_tui_classic_hotel])

  end

  def check_new_to_tui_video
    scroll_page_and_assert_text(@@new_to_tui_discover_tui, "up")
    click_on_text(@@new_to_tui_video)
    wait_for_text("Done")
    click_accessibility_label "Done"
    assert_wait_for_text(@@new_to_tui_discover_tui)
  end
end
