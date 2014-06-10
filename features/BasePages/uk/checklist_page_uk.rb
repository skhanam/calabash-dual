class ChecklistPageUk < BasePage

  def verify_checklist_page
    sleep 2
    $g_engChecklist.each do |var|
      txt=escape_quotes(var["message"])
      scroll_page_till_partial_text (txt[0..20])
      #click_on_partial_text (txt[0..30])
      #sleep 1
      #scroll_page_and_assert_text txt
      #click_on_text txt
      #puts %Q(verified #{txt})
    end
  end

  def open_to_do_list
    fail if (element_exists("* text:'#{@@to_do_lists}'")!=true)
    assert_text_present @@my_do_list
    click_on_text @@to_do_lists
  end

  def select_first_check_list_item
    query_txt="#{$g_query_txt}marked:'#{@@check_list_item_text_acc}' index:0" if $g_ios
    query_txt= "#{$g_query_txt}contentDescription:'#{@@check_list_item_text_acc}.' index:0" if $g_android

    puts "#{query_txt}"
    res=query(query_txt, :text).first

    query_txt="#{$g_query_txt}marked:'#{@@check_list_check_box_acc}' index:0" if $g_ios
    query_txt= "#{$g_query_txt}contentDescription:'#{@@check_list_check_box_acc}.' index:0" if $g_android

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
