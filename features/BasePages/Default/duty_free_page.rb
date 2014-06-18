class DutyFreePage < BasePage

  def check_duty_free_page
    verify_page_title @@duty_free_title
  end

  def click_tax_free_link
    click_accessibility_label "dutyfree_link"
    click_on_text @@duty_free_webview_link
  end

  def check_webview
    txt="Logga ut"
    query="webView css:'*' {textContent CONTAINS '#{txt}'}"
    assert_wait_for_element(query,20)
  end
end