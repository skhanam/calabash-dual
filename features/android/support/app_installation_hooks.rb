require 'calabash-android/management/app_installation'


AfterConfiguration do |config|
  FeatureNameMemory.feature_name = nil
end

Before do |scenario|
  @scenario_is_outline = (scenario.class == Cucumber::Ast::OutlineTable::ExampleRow)
  if @scenario_is_outline
    scenario = scenario.scenario_outline
  end

  feature_name = scenario.feature.title

  if FeatureNameMemory.feature_name != feature_name \
      or ENV["RESET_BETWEEN_SCENARIOS"] == "1"
    if ENV["RESET_BETWEEN_SCENARIOS"] == "1"
      log "New scenario - reinstalling apps"
    else
      log "First scenario in feature - reinstalling apps"
    end

    FeatureNameMemory.feature_name = feature_name
    FeatureNameMemory.invocation = 1
  else
    FeatureNameMemory.invocation += 1
  end

  puts "Launching app"
  start_test_server_in_background
  sleep 3
end


FeatureNameMemory = Class.new
class << FeatureNameMemory
  @feature_name = nil
  attr_accessor :feature_name, :invocation
end
