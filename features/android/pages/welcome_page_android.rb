require 'calabash-android/abase'
class WelcomePage < BasePage

  def trait

    "* text:'Welcome'"

  end

  def await(opts={})

    sleep 20

    #wait_for_elements_exist([trait])

    self

  end

  def login(user)

    #query("* text:'Username or email:'",{:setText => user[:email]})
    #
    #query("* text:'Password:'",{:setText => user[:password]})
    #
    #touch(login_button_query)
    #
    #sleep(5)

  end

  def login_button_query
    "* text:'Log in'"
  end

end