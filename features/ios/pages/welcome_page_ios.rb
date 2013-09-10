require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

  class WelcomePage < BasePage

    def trait

      "label marked:'Welcome'"

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

    end

  end