class ExcursionsPage < BasePage

  def check_excursions_page
    verify_page_title @@excursions_title
  end

  def click_excursions_link
    click_on_text @@side_panel_link
  end

  def check_excursions_webview
    sleep 10
    query="webView css:'*' {textContent CONTAINS '#{@@side_panel_link}'}"
    assert_element query
  end
end