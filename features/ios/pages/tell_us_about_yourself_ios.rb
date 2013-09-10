require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class TellUsAboutYourself < BasePage

  attr_accessor :page

  def trait

    "label marked:'Tell us about yourself'"

  end

  def already_with_tui_link

    "label marked:'I’m already with TUI'"

  end

  def transition_as_already_tui_user

    transition(:tap => already_with_tui_link, @page => HaveYouUsedMeineTuiOnlinePage)

    sleep 5

  end

end