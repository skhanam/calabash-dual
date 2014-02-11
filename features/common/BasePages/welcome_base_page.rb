#require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
#require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'


class WelcomeBasePage < BasePage

  def trait
    @hasharr={}
    $g_query_txt+"marked:'#{@@welcome_page_text}'"
  end

  def check_welcome_screen
   wait_for_text(@@welcome_page_text,2)
  end

  def verify_welcome_screen
    assert_wait_for_text(@@welcome_page_text)
  end

  def verify_welcome_page
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@welcome_page_text}'"],
                            :timeout => 5)

    assert_text_present(@@welcome_page_text)
    assert_text_present(@@already_a_customer)
    assert_text_present(@@have_already_booked_through_TUI)
    assert_text_present(@@am_new_here)
    assert_text_present(@@have_never_booked_through_TUI_before)
  end

  def click_already_customer
    touch_and_verify(@@have_already_booked_through_TUI, @@already_customer_title)
    return AlreadyCustomerBasePage.new
  end

  def click_login_text
    puts "waiting"
    sleep(5)
    click_on_text(read_str('welcome_cta_login'))
  end

  def await(opts={})
    wait_for_elements_exist([trait], :timeout => 5)
    self
  end

  def login_button_query
    $g_query_txt+"text:#{read_str('welcome_login_header')}"
  end

  def navigate_to_login
    verify_welcome_screen
    click_already_customer
    AlreadyCustomerBasePage.new.check_already_customer_screen
    sleep 1
    click_on_text(@@login_with_existing_credentials)
    assert_wait_for_text(@@login_page_text, 5)

    @@user_details= @@user_details || User.new
  end


  def click_new_here
    touch_and_verify(@@am_new_here, @@new_to_tui_discover_tui)
  end



end