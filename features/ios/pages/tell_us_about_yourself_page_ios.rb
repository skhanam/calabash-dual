require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class TellUsAboutYourselfPage < BasePage

  attr_accessor :page

  def trait

    "view marked:'Tell us about yourself'"

  end

  def await(opts={})

    sleep 3

    wait_for_elements_exist([trait])

    self

  end

end