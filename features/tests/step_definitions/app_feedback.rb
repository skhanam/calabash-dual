When(/^I submit default rating App feedback page$/) do
  @appFeedbackPage.submit_default_feedback
end

Then(/^verify rating submitted message$/) do
  @appFeedbackPage.verify_default_submitted_feedback
end

Given(/^I have submitted default rating$/) do
  step 'I am on home screen with default booking'
  step 'I navigate to App feedback page'
  step 'I submit default rating App feedback page'
  step 'verify rating submitted message'
end

When(/^I select change rating on feedback submitted page$/) do
  @appFeedbackPage.select_change_rating_button
end