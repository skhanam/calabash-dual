class DutyFreePage < BasePage

  def check_duty_free_page
    verify_page_title @@tui_service_title
  end

  def click_tax_free_link
    click_on_text @@duty_free_webview_link
  end

  def check_webview
    txt="Logga ut"
    query="webView css:'*' {textContent CONTAINS '#{txt}'}"
    assert_element(query)
  end
end