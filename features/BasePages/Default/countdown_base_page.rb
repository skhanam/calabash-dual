class CountDownBasePage < BasePage

  #def initialize
  #end
  def check_countdown_screen_title
    verify_page_title(@@countdown_page_title)
  end

  def check_days_left_to_travel
    res1=CommonMethods.new.get_countdown_days.to_s.to_i
    res2=get_acc_label_text("days_to_go").to_i
    puts "#{res1} != #{res2}"
    fail("Number of days are wrong") if (res1 != res2)
  end

end
