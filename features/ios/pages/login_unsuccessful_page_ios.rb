require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'


class LoginUnsuccessfulPage  < BasePage

  def trait

    "view marked:'Oops something went wrong'"

  end

  def assert_invalid_login_message(message)

    check_element_exists(trait)

    query(invalid_login_message(message)).count.should == 1

  end

  def invalid_login_message(message)

    "view marked:'#{message}'"

  end

end