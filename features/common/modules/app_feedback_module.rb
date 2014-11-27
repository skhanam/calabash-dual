require_relative 'base_module'

module AppFeedbackModule
  include BaseModule

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  module Phone
    include BaseModule

    def verify_app_feedback_page
      assert_text_present @@app_feed_back_title1
      assert_text_present @@app_feed_back_title2

      if check_text_in_view(@@app_feed_back_submit)
        assert_text_present @@app_feed_back_submit
        puts 'feed back to be submitted'
      elsif check_text_in_view(@@app_feed_back_rate_again)
        verify_default_submitted_feedback
        puts 'Already rated'
      end
    end

    def verify_default_submitted_feedback
      assert_wait_for_text @@app_feed_back_title1
      assert_wait_for_text @@app_feed_back_title2
      assert_partial_text @@app_feed_back_negative_rating
      assert_partial_text escape_quotes @@feedback_message_negative

      if $g_eng_app
        assert_partial_text (@@app_feed_back_you_rated.gsub(/(\[.*?\])(\/)(\[.*?\])/, '5\210'))
      else
        assert_partial_text (@@app_feed_back_you_rated.gsub(/(\[.*?\]) (.*?) (\[.*?\])/, '5 \2 10'))
      end

      scroll_page_and_assert_text @@app_feed_back_rate_again
      scroll_page_and_assert_text @@app_feed_back_email_us
    end


  end

  module Tablet
    include BaseModule
    def verify_default_submitted_feedback
      assert_wait_for_text @@app_feed_back_title2
      wait_for_partial_text_shown escape_quotes @@feedback_message_negative

      if $g_eng_app
        assert_partial_text escape_quotes (@@app_feed_back_you_rated.gsub(/(\[.*?\])(\/)(\[.*?\])/, '5\210'))
      else
        assert_partial_text escape_quotes (@@app_feed_back_you_rated.gsub(/(\[.*?\]) (.*?) (\[.*?\])/, '5 \2 10'))
      end

      scroll_page_and_assert_text @@app_feed_back_rate_again
      scroll_page_and_assert_text @@app_feed_back_email_us
    end


    def verify_app_feedback_page
      assert_wait_for_text @@app_feed_back_title2

      if check_text_in_view(@@app_feed_back_submit)
        assert_text_present @@app_feed_back_submit
        puts 'feed back to be submitted'
      elsif check_text_in_view(@@app_feed_back_rate_again)
        verify_default_submitted_feedback
        puts 'Already rated'
      end
    end
  end

end
