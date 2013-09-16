require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class SignUpPage < BasePage

    def trait

      "view marked:'Sign up'"

    end

    def await(opts={})

      sleep 2

      wait_for_elements_exist([trait])

      self

    end

end
