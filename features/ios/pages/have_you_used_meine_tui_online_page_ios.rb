require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class HaveYouUsedMeineTuiOnlinePage < BasePage

  attr_accessor :page

  def trait

    "view marked:'Have you used meine TUI online?'"

  end

  def logged_in_before_link

    "label marked:'That’s great – just use the same log in details to use this app.'"

  end

  def transition_to_welcome_page

    transition(:tap => logged_in_before_link, @page => WelcomePage)

    sleep 5

  end

  def await(opts={})

    sleep 2

    wait_for_elements_exist([trait])

    self

  end

end