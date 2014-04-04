class LoginBasePage < BasePage

  def check_username_pwd_error
    assert_text_present @@username_email_error
  end


  def verify_login_screen
    wait_for_elements_exist([$g_query_txt+"marked:'#{@@login_page_text}'"])
  end

  def trait
    $g_query_txt+"marked:'#{@@login_page_text}'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def click_forgot_password
    click_on_text @@password_reset
    assert_wait_for_text @@forgot_password_title
  end

  def enter_default_username_password
    username= $g_user_details[:username]
    password= $g_user_details[:password]
    enter_credentials(username, password)
  end

  #TODO for privacy policy terms and conditions
  #to check html use these queries
  #js = 'document.body.innerHTML'
  #query("webView", :stringByEvaluatingJavaScriptFromString => js)
  #query("webView xpath:'/html/body/text()[4]'")
  #query("webView xpath:'html/body/strong[3]/p'")

  def navigate_to_forgot_password
    scroll_page_and_assert_text @@login_forgot_password
    click_on_text @@login_forgot_password
    assert_wait_for_text @@forgot_password_title
  end

  def submit_login_button
    sleep 1
    click_on_text(@@login_button)
    return HomePage.new
  end

  def check_login_screen
    assert_wait_for_text(@@login_page_text)
  end


  def getDayNumberSuffix(day)
    day=day.to_i
    if (day >= 11 && day <= 13)
      return "th";
    end

    case day%10
      when 1
        return "st"
      when 2
        return "nd"
      when 3
        return "rd"
      else
        return "th"
    end
  end


  def navigate_to_terms
    scroll_page_and_assert_text @@privacy_terms_of_use
    click_on_text @@privacy_terms_of_use
  end
end
