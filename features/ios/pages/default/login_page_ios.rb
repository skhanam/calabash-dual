require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class LoginPage < BasePage

  def trait
    "* marked:'#{@@login_page_text}'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

end