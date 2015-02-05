require_relative 'base_module'
module ExtrasModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def verify_extra_biscuit
    assert_wait_for_acc @@home_page_holiday_extra_Biscuit_acc
    assert_wait_for_text @@holiday_extras
  end

  def click_extra_biscuit
    click_acc_label @@home_page_holiday_extra_Biscuit_acc
  end

  def verify_extras_page
    sleep 2
    assert_text_present @@extras_page_title_acc
  end

  module Phone

  end

  module Tablet
    include BaseModule


  end
end