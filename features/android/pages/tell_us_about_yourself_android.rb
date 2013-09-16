require 'calabash-android/abase'

class TellUsAboutYourself < BasePage

  attr_accessor :page

  def trait

    "* text:'Tell us about yourself'"

  end


  def await(opts={})

    sleep 10

    wait_for_elements_exist([trait])

    self

  end

  def transition_as_already_tui_user

    await

    if element_exists("* marked:'I’m already with TUI'")

      puts "Element exist"

      #touch(query("ti.modules.titanium.ui.widget.TiUILabel$1 marked:'iamnewtotui. iamnewtotui.'"))

      #Nothing works like touch or PerformAction only click on screen works which is not advisable

      performAction('click_on_screen', query(trait, :x)[0], 75)

    end

    sleep 5

  end

end