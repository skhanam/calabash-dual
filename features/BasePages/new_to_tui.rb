class NewTOTUIBasePage < BasePage

  def initialize
  end

  def check_new_to_tui_screen
    fail("Copy not present")
    assert_wait_for_text(@@already_customer_title)

  end

  def check_new_to_tui_page
    check_new_to_tui_screen
  end

end
