# encoding: utf-8
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
  end

  def method_missing sym, *args, &block
    send sym, *args, &block
  end

  def self.element element_name
    define_method element_name.to_s
  end

  class << self
    alias :value    :element
    alias :action   :element
    alias :trait    :element
  end



  def write_hash_to_file(count)
    @@result_hash.each do |key, var|
      write_welcome_messages_to_file("#{key}:   is shown #{var}/#{count} times")
    end
  end
end
