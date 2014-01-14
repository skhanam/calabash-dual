require 'calabash-cucumber/launcher'

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new


  if([scenario.source_tag_names][0].include? "@reset")
    ENV['RESET_BETWEEN_SCENARIOS']="1"
  else
    ENV['RESET_BETWEEN_SCENARIOS']="0"
  end

  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end

  BasePage.new.set_strings
end


After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end
