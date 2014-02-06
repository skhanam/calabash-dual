# encoding: utf-8
require_relative '../../../common/BasePages/home_base_page'

class HomePage < HomeBasePage


  def logout_from_home_screen
    return WelcomePage.new
  end


  def check_welcome_messages
    msg=nil
    no_of_days_to_go=-15 #Hard coded for now until test data is available
    if (no_of_days_to_go < -14 && no_of_days_to_go >= -548)
      msg="bald geht's in den Urlaub!"
    elsif (no_of_days_to_go < -3 && no_of_days_to_go >= -14)
      msg="nur noch dreimal schlafen, dann geht 's endlich los!"
    elsif (no_of_days_to_go == -3)
      msg="Ihre Reise steht vor der Tür.Sind Sie schon urlaubsreif?"
    elsif (no_of_days_to_go == -2)
      msg="schon aufgeregt? Wir freuen uns, Sie bald begrüßen zu dürfen!"
    elsif (no_of_days_to_go == -1)
      msg="morgen geht' s los! Haben Sie an alles gedacht?"
    elsif (no_of_days_to_go == 0)
      msg="wir wünschen Ihnen einen schönen Urlaub!"
    elsif (no_of_days_to_go > 1 && no_of_days_to_go <= 7)
      msg="willkommen zurück! Wir hoffen, Sie hatten einen schönen Urlaub."
    elsif (no_of_days_to_go > 7)
      msg="sind Sie schon wieder reif für die Insel?"
    else
      fail("Days are incorrect")
    end

    wait_for_label(msg, 20)

  end

  def open_side_panel
    sleep 1
    swipe_dir("right")
    sleep 1
  end

  def click_booking_summary_biscuit
    scroll_page_and_assert_text("booking_summary", "down")
    touch_transition("view marked:'booking_summary'", "view text:'#{@@booking_summary_booking_code}'", {:timeout => 5, :retry_frequency => 1})
  end

end

