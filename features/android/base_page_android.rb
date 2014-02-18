# encoding: utf-8
require 'calabash-android/abase'
require_relative '../common/support/reusable_methods'
require_relative '../common/support/application_strings'
require_relative 'support/reusable_methods_android'
require_relative '../common/support/common_methods'
require_relative '../common/support/Z_view_functions'
require_relative '../common/support/data_models'
require 'differ'

$g_strings_set=false
class BasePage < Calabash::ABase
  include AppStrings
  include AndroidReusableMethods
  include CommonMethods
  include ViewModule
  include UserData
  include ReusableMethods

  def write_hash_to_file(count)
    @@result_hash.each do |key, var|
      write_welcome_messages_to_file("#{key}:   is shown #{var}/#{count} times")
    end
  end
end
