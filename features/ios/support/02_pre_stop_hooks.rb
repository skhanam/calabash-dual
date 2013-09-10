if defined?(Calabash) && defined?(Calabash::Cucumber)
  require 'calabash-cucumber/operations'
  require 'calabash-cucumber/calabash_steps'

  class CallbackWorld
    include ::Calabash::Cucumber::Operations

    def on_launch
      begin
        puts "Launching application"
        sleep 10
        wait_for_elements_exist(["view marked:'Tell us about yourself'"], :timeout => 45)
        wait_for_animation
        @page = page(TellUsAboutYourself)

      rescue Calabash::Cucumber::WaitHelpers::WaitError
        #May not appear so ignore timeout error
      end
    end
  end

  World do
    ::CallbackWorld.new
  end
end
