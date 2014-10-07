class HolidayExtrasBasePage  < BasePage

  def verify_extra_biscuit
    assert_wait_for_acc(@@home_page_holiday_extra_Biscuit_acc)
  end

  def click_extra_biscuit
    click_acc_label(@@home_page_holiday_extra_Biscuit_acc)
  end

  def verify_extra_biscuit_page
    assert_wait_for_acc(@@extras_page_title_acc)
  end
end