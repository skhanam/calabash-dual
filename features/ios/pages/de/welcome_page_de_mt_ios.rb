require_relative '../../../BasePages/welcome_base_page'

class WelcomePage < WelcomeBasePage

  def navigate_to_login
    verify_welcome_page

    click_on_text(@@have_already_booked_through_TUI)
    wait_for_text_to_appear_view(@@login_options_text, 3)
    wait_for_text_to_appear_view(@@already_registered, 3)
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    wait_for_text_to_appear_view(@@login_page_text, 5)

    @@user_details= @@user_details || User.new
    puts "1 details #{@@user_details.attributes}"

    return LoginPage.new
  end


  def verify_welcome_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@welcome_page_text}'"],
                            :timeout => 5)

    check_text_must_be_in_view(@@welcome_page_text)
    check_text_must_be_in_view(@@already_a_customer)
    check_text_must_be_in_view(@@have_already_booked_through_TUI)
    check_text_must_be_in_view(@@am_new_here)
    check_text_must_be_in_view(@@have_never_booked_through_TUI_before)
  end
end