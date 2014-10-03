class ExcursionsPage < BasePage

  def click_excursions_link
    click_acc_label "Excurions_button"
  end

  def check_excursions_webview
    sleep 10
    query="webView css:'*' {textContent CONTAINS '#{@@side_panel_link}'}"
    assert_wait_for_element(query,20)
  end
end