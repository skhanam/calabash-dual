require 'calabash-android/management/adb'
require 'calabash-android/operations'


Before do |scenario|
  sleep 5
end

After do |scenario|
  if scenario.failed?
    screenshot_embed
    #clear_app_data
  end
  shutdown_test_server
end
