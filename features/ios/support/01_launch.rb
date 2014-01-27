require 'calabash-cucumber/launcher'

#if([scenario.source_tag_names][0].include? "@reset")
#  ENV['RESET_BETWEEN_SCENARIOS']="1"
#else
#  ENV['RESET_BETWEEN_SCENARIOS']="0"
#end


Before do |scenario|
  initialize_all
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  scenario_tags = scenario.source_tag_names
  if scenario_tags.include?('@reset')
    @calabash_launcher.reset_app_jail
  end

  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end

  #start_test_server_in_background(:timeout=>30)
end


After do |scenario|
  if scenario.failed?
    screenshot_embed
  end

  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end
