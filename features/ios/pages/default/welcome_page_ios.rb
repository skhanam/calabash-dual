require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class WelcomePage < BasePage

  def trait
    sleep(5)
    "view "+"marked:'#{@@welcome_page_text}'"
  end

  def navigate_to_login
    transition(:tap => @@welcome_page_ready_to_login, :page => LoginPage)
  end

  def click_login_text
    puts "waiting"
    sleep(5)
    click_on_text(@@welcome_page_login_text)
  end

  def login(user)

    touch("label marked:'Enter username or email'")

    await_keyboard

    keyboard_enter_text user[:username]

    done

    touch("label marked:'Enter password'")

    await_keyboard

    keyboard_enter_text user[:password]

    done

    touch("label marked:'Log in'")

    wait_for_elements_do_not_exist(["label marked:'Log in'"],
                                   :timeout => 60)

    sleep 10

  end


end