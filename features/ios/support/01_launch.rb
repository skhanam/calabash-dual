require 'calabash-cucumber/launcher'

Before do |scenario|
  sleep 5
  initialize_all
  #set_strings
  @calabash_launcher = Calabash::Cucumber::Launcher.new

  scenario_tags = scenario.source_tag_names

  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch(:timeout => 60) if !scenario_tags.include?('@reset')
    @calabash_launcher.relaunch(:timeout => 60,:reset=>true) if scenario_tags.include?('@reset')
    @calabash_launcher.calabash_notify(self)
  end

  if scenario_tags.include?('@reset')
    $selected_booking="NA"
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
