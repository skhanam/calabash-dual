require_relative 'base_module'
module ChecklistModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def verify_checklist_page
    assert_wait_for_text "Add item"
    assert_partial_text "Packing list"
    assert_partial_text "To Do list"
  end

  module Phone
    include BaseModule


    def open_to_do_list
      fail if !element_exists("* text:'#{@@to_do_lists}'")
      assert_text_present @@my_do_list
      click_on_text @@to_do_lists
    end

    def check_packaging_items(num)
      verify_page_title("ITEMS TO PACK (#{num})")
    end


    def open_packaging_list
      assert_wait_for_acc "packingList"
      click_acc_label "packingList"
    end

  end

  module Tablet
    def open_to_do_list
      assert_text_present "To Do list"
      click_on_text "To Do list"
    end

    def open_packaging_list
      click_on_partial_text "Packing list"
      assert_wait_for_text "Start your packing list here"
    end

    def check_packaging_items(num)
      assert_wait_for_text "Packing list (0)"
      assert_wait_for_text "Start your packing list here"
    end
  end

end
