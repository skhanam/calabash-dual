class AppFeedbackBasePage < BasePage
 include AppFeedbackModule
  def check_app_feedback_title
    verify_page_title @@app_feed_back_title1
  end


  def submit_default_feedback
    if check_text_in_view(@@app_feed_back_rate_again)
      puts "Already rated"
      click_on_text @@app_feed_back_rate_again
      sleep 2
    end

    assert_wait_for_text @@app_feed_back_submit
    click_on_text @@app_feed_back_submit
    sleep 2

  end

  def verify_default_submitted_feedback
    assert_wait_for_text @@app_feed_back_title1
    assert_wait_for_text @@app_feed_back_title2
    wait_for_partial_text_shown @@app_feed_back_negative_rating
    wait_for_partial_text_shown @@app_feed_back_message_negative

    if $g_eng_app
      wait_for_partial_text_shown (@@app_feed_back_you_rated.gsub(/(\[.*?\])(\/)(\[.*?\])/, '5\210'))
    else
      wait_for_partial_text_shown (@@app_feed_back_you_rated.gsub(/(\[.*?\]) (.*?) (\[.*?\])/, '5 \2 10'))
    end

    scroll_page_and_assert_text @@app_feed_back_rate_again
    scroll_page_and_assert_text @@app_feed_back_email_us
  end


  def select_change_rating_button
    click_on_text @@app_feed_back_rate_again
  end
end

