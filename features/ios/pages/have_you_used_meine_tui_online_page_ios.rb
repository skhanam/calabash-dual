require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class HaveYouUsedMeineTuiOnlinePage < BasePage

  attr_accessor :page

  def trait

    "view marked:'Have you used meine TUI online?'"

  end

  def await(opts={})

    sleep 3

    wait_for_elements_exist([trait])

    self

  end

end