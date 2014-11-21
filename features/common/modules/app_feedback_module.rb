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
        puts "feed back to be submitted"
      elsif check_text_in_view(@@app_feed_back_rate_again)
        verify_default_submitted_feedback
        puts "Already rated"
      end
    end
  end

  module Tablet
    include BaseModule

    def verify_app_feedback_page
      assert_wait_for_text @@app_feed_back_title2

      if check_text_in_view(@@app_feed_back_submit)
        assert_text_present @@app_feed_back_submit
        puts "feed back to be submitted"
      elsif check_text_in_view(@@app_feed_back_rate_again)
        verify_default_submitted_feedback
        puts "Already rated"
      end
    end
  end

end
