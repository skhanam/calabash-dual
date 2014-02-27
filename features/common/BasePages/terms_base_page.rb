class TermsAndConditionsBasePage < BasePage

  def check_t_and_c_title
    verify_page_title @@terms_title
  end

  def check_t_and_c_page
    sleep 3
    fail()
    query("* css:'body>p:nth-child(1)>strong'",:textContent).first
    fail("element not present") if element_exists "#{$g_query_txt}webview css:'#{@@de_terms_web_content_title}'"
  end

end

