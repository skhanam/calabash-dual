class AppFeedbackBasePage < BasePage
 include AppFeedbackModule
  def check_app_feedback_title
    verify_page_title @@app_feed_back_title1
  end


  def submit_default_feedback
    sleep 2
    if check_text_in_view(@@app_feed_back_rate_again)
      puts "Already rated"
      click_on_text @@app_feed_back_rate_again
      sleep 2
    end

    assert_wait_for_text @@app_feed_back_submit
    click_on_text @@app_feed_back_submit
    sleep 2

  end



  def select_change_rating_button
    click_on_text @@app_feed_back_rate_again
  end
end

