When(/^I submit default rating App feedback page$/) do
  @appFeedbackPage.submit_default_feedback
end

Then(/^verify rating submitted message$/) do
  @appFeedbackPage.verify_default_submitted_feedback
end