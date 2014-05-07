class AppFeedbackBasePage < BasePage

  def check_app_feedback_title
    verify_page_title @@app_feed_back_title1
  end

  def verify_app_feedback_page
    assert_text_present @@app_feed_back_title1
    assert_text_present @@app_feed_back_title2

    if check_text_in_view(@@app_feed_back_rate_again)
      verify_default_submitted_feedback
      puts "Already rated"
    elsif check_text_in_view(@@app_feed_back_submit)
      assert_text_present @@app_feed_back_submit
      puts "feed back to be submitted"
    end
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
    wait_for_partial_text_shown @@app_feed_back_negative_rating
    wait_for_partial_text_shown @@app_feed_back_message_negative

    if $g_eng_app
      wait_for_partial_text_shown (@@app_feed_back_you_rated.gsub(/(\[.*?\])(\/)(\[.*?\])/, '5\210'))
    else
      wait_for_partial_text_shown (@@app_feed_back_you_rated.gsub(/(\[.*?\]) (.*?) (\[.*?\])/, '5 \2 10'))
    end
  end
end

