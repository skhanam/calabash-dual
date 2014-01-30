require 'calabash-cucumber/ibase'

require_relative '../common/support/reusable_methods'
require_relative '../../features/common/support/application_strings'
require_relative '../ios/support/reusable_methods_ios'
require_relative '../common/support/common_methods'
require_relative '../common/support/Z_view_functions'
require_relative '../common/support/data_models'
require 'differ'

$g_strings_set=false
class BasePage < Calabash::IBase
  include AppStrings
  include IosReusableMethods
  include CommonMethods
  include ViewModule
  include UserData
  include ReusableMethods

  def initialize
    #puts caller.first
    #set_strings
    #await
    self
  end

  def write_hash_to_file(count)
    @@result_hash.each do |key, var|
      write_welcome_messages_to_file("#{key}:   is shown #{var}/#{count} times")
    end
  end
end
