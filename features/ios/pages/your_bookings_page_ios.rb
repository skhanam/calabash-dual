require 'calabash-cucumber/operations'
require 'calabash-cucumber/calabash_steps'

class YourBookingsPage < BasePage

  def trait

    "view marked:'Your Bookings'"

  end

  def await(opts={})

    sleep 2

    wait_for_elements_exist([trait])

    self

  end

end