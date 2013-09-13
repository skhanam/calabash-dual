require 'calabash-android/abase'
class HaveYouUsedMeineTuiOnlinePage < BasePage


  def trait

    "* text:'Have you used meine TUI online?'"

  end

  def logged_in_before_link

    "* marked:'That’s great – just use the same log in details to use this app.'"

  end

  def transition_to_welcome_page

    #transition(:tap => logged_in_before_link, :page => WelcomePage)
    #
    #sleep 5

  end

end