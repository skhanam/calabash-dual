require 'calabash-cucumber/ibase' if ENV['PLATFORM'] == 'ios'
require 'calabash-android/abase' if ENV['PLATFORM'] == 'android'
require_relative '../support/reusable_methods'
require_relative '../../features/support/uk_first_choice_strings'
require_relative '../../features/android/support/reusable_methods_android'
require_relative '../support/common_methods'
require 'differ'

class BasePage < Calabash::ABase
  include UKFirstChoice
  include AndroidReusableMethods
  include CommonMethods

  def initialize
    puts caller.first
    set_strings
    await
    self
  end

  def await
  end
end


#
#
#if ENV['PLATFORM'] == 'ios'
#  puts "class defined here"
#  fail("here")
#  class BasePage < Calabash::IBase
#    include CommonMethods
#    include UKFirstChoice
#    include ReusableMethods
#
#    def initialize
#      set_strings
#    end
#  end
#
#elsif ENV['PLATFORM'] == 'android'
#  puts "class defined here android"
#  fail("here2")
#
#
#  class BasePage < Calabash::ABase
#    include CommonMethods
#    include UKFirstChoice
#    include ReusableMethods
#
#    def initialize
#      set_strings
#    end
#  end
#end


