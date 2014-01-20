require 'calabash-android/abase'
require_relative '../../../BasePages/welcome_base_page'

class WelcomePage < WelcomeBasePage

  def navigate_to_login
    await(:timeout => 5)
    sleep(2)

    click_on_text(@@have_already_booked_through_TUI)
    wait_for_text_to_appear_view(@@login_options_text, 3)
    wait_for_text_to_appear_view(@@already_registered, 3)
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    wait_for_text_to_appear_view(@@login_page_text, 5)

    @@user_details= @@user_details || User.new
    return LoginPage.new
  end

end