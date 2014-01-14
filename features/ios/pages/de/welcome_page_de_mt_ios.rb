require_relative '../../../BasePages/welcome_page'

class WelcomePage < WelcomeBasePage

  def navigate_to_login
    #wait_for_text_to_appear_view(@@welcome_page_text, 5)
    verify_welcome_page
    playback "touch_button", {:query => $g_query_txt+"marked:'#{@@have_already_booked_through_TUI}'"}
    wait_for_text_to_appear_view(@@login_options_text, 3)
    wait_for_text_to_appear_view(@@already_registered, 3)
    sleep 1
    playback "touch_button", {:query => $g_query_txt+"marked:'#{@@login_with_existing_credentials}'"}
    wait_for_text_to_appear_view(@@login_page_text, 5)

    return LoginPage.new
  end


  def verify_welcome_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@welcome_page_text}'",
                             $g_query_txt+"marked:'#{@@already_a_customer}'",
                             $g_query_txt+"marked:'#{@@have_already_booked_through_TUI}'",
                             $g_query_txt+"marked:'#{@@am_new_here}'",
                             $g_query_txt+"marked:'#{@@have_never_booked_through_TUI_before}'"],
                            :timeout => 5)
  end
end