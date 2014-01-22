#require 'calabash-android/abase'
require_relative 'base_page_ios' if ENV['PLATFORM'] == 'ios'
require_relative 'base_page_android' if ENV['PLATFORM'] == 'android'

class MyBookingsBasePage < BasePage

  def initialize
  end

  def check_my_bookings_screen
      wait_for_text_to_appear_view(@@my_bookings_title,5)
  end
end
