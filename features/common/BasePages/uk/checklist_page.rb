class ChecklistPage < BasePage

  def open_to_do_list
    assert_text_elements([@@my_packaging_list,
                         @@my_do_list])
    click_on_text @@to_do_lists
  end

  def select_first_check_list_item
    res=query("#{$g_query_txt}marked:'#{@@check_list_item_text_acc}' index:0", :text).first
    puts "#{$g_query_txt}marked:'#{@@check_list_check_box_acc}' index:0"
    touch("#{$g_query_txt}marked:'#{@@check_list_check_box_acc}' index:0")
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
    CommonMethods.new.scroll_page_till_partial_text text
    sleep 1
    count=query("#{$g_query_txt}marked:'#{@@check_list_check_box_acc}'").count
    touch("#{$g_query_txt}marked:'#{@@check_list_check_box_acc}' index:#{count-1}")
    puts "@@check_list_check_box_acc:#{@@check_list_check_box_acc}"
    sleep 1

  end

  def verify_unselected_item(text)
    scroll_page_and_assert_text(text, "up")
  end
end
