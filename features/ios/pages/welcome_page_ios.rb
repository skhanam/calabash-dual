require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

  class WelcomePage < BasePage

    def trait

      "view marked:'Welcome'"

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
                                     :timeout => 30)

      sleep 5

    end

    def assert_invalid_login_message(message)

      check_element_exists(trait)

      query(invalid_login_message(message)).count.should == 1

    end

    def invalid_login_message(message)

      "view marked:'#{message}'"

    end

  end