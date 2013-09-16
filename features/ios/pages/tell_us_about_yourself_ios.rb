require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class TellUsAboutYourself < BasePage

  attr_accessor :page

  def trait

    "view marked:'Tell us about yourself'"

  end

  def await(opts={})

    sleep 2

    wait_for_elements_exist([trait])

    self

  end

  def already_with_tui_link(text)

   "label marked:'#{text}'"

  end

  def transition_as_already_tui_user(page_name, text)

    transition(:tap => already_with_tui_link(text), @page => HaveYouUsedMeineTuiOnlinePage)

    sleep 5

  end

end