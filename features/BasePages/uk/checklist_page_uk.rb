class ChecklistPageUk < BasePage
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
  end

  def verify_checklist_items
    sleep 2
    $g_engChecklist.each do |var|
      txt=escape_quotes(var["message"])
      scroll_page_till_partial_text (txt[0..20])
      #
    end
  end

  def check_packaging_items(num)
    assert_wait_for_text "Packing list (0)"
    assert_wait_for_text "Start your packing list here"
  end

  def check_options_for_packaging_item
   assert_wait_for_acc "deleteBox"
   assert_wait_for_acc "pencil"
  end

  def verify_item_deleted
    @text_delete = "Delete"

    click_acc_label "deleteBox"
    sleep 1
    touch("view text:'#{@text_delete}'")
  end

  def packaging_item_not_present
    fail("packaging_item_not_present: text must have been deleted #{@@packaging_item_title}") if check_text_in_view @@packaging_item_title
  end

  def delete_packaging_item
    click_acc_label "deleteBox"
    sleep 1
    assert_text_present @@delete_item
    assert_text_present @@are_you_sure
    assert_text_present @@cancel
    click_on_text @@delete
  end

  def select_packaging_item
    click_on_text @@packaging_item_title
  end

  def check_packaging_item
    assert_wait_for_text  @@packaging_item_title
  end

  def add_new_packaging_item
    click_acc_label "navbarRightButton"
    sleep 1
    input_text @@packaging_item_title
  end

  def open_packaging_list
    click_on_partial_text "Packing list"
    assert_wait_for_text "Start your packing list here"
  end


  def select_first_check_list_item
    query_txt="#{$g_query_txt}marked:'#{@@check_list_item_text_acc}' index:0" if $g_ios
    query_txt= "#{$g_query_txt}contentDescription:'#{@@check_list_item_text_acc}.' index:0" if $g_android

    puts "#{query_txt}"
    res=query(query_txt, :text).first

    query_txt="#{$g_query_txt}marked:'#{@@check_list_check_box_acc}' index:0" if $g_ios
    query_txt= "#{$g_query_txt}contentDescription:'#{@@check_list_check_box_acc}.' index:0" if $g_android
    sleep 2
    touch(query_txt)
    return res
  end

  def show_completed_items
    CommonMethods.new.scroll_page_till_acc @@check_list_email_items
    sleep 2
    puts check_partial_text_shown @@checklist_hidden_title
    puts check_partial_text_shown @@checklist_completed_title

    if check_partial_text_shown(@@checklist_hidden_title)!=true
      click_on_partial_text @@checklist_completed_title
    end
    sleep 4
  end

  def unselect_selected_item(text)
    scroll_page_till_partial_text text
    sleep 1
    count=query("#{$g_query_txt}marked:'#{@@check_list_check_box_acc}'").count if $g_ios
    touch("#{$g_query_txt}marked:'#{@@check_list_check_box_acc}' index:#{count-1}") if $g_ios

    count=query("#{$g_query_txt}contentDescription:'#{@@check_list_check_box_acc}.'").count if $g_android
    touch("#{$g_query_txt}contentDescription:'#{@@check_list_check_box_acc}.' index:#{count-1}") if $g_android
    sleep 1

  end

  def verify_unselected_item(text)
    scroll_page_and_assert_text(text, "up")
  end
end
