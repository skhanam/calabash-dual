require 'calabash-android/management/app_installation'


AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
end

Before do |scenario|
  initialize_all
  #set_strings
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline
    scenario = scenario.scenario_outline
  end

  scenario_tags = scenario.source_tag_names
  if scenario_tags.include?('@reset')
    clear_app_data
    $selected_booking="NA"
  else
    feature_name = scenario.feature.title
    if FeatureNameMemory.feature_name != feature_name \
      or ENV["RESET_BETWEEN_SCENARIOS"] == "1"
      if ENV["RESET_BETWEEN_SCENARIOS"] == "1"
        log "New scenario - reinstalling apps"
        uninstall_apps
        install_app(ENV["TEST_APP_PATH"])
        install_app(ENV["APP_PATH"])
      else
        log "First scenario in feature - reinstalling apps"
      end

      FeatureNameMemory.feature_name = feature_name
      FeatureNameMemory.invocation = 1
    else
      FeatureNameMemory.invocation += 1
    end
  end

  #puts "Launching app"
  start_test_server_in_background(:Timeout=>30)
  sleep 3
end


FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end
