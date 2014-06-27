# encoding: utf-8
require 'calabash-cucumber/ibase'

require_relative '../common/support/reusable_methods'
require_relative '../../features/common/strings/application_strings'
require_relative '../ios/support/reusable_methods_ios'
require_relative '../common/support/Z_view_functions'
require 'differ'

$g_strings_set=false
class BasePage < Calabash::IBase
  include AppStrings
  include IosReusableMethods
  include ViewModule
  include ReusableMethods

  def initialize
  end

  def write_hash_to_file(count)
    @@result_hash.each do |key, var|
      write_welcome_messages_to_file("#{key}:   is shown #{var}/#{count} times")
    end
  end


end
