if defined?(Calabash) && defined?(Calabash::Cucumber)
  require 'calabash-cucumber/operations'
  class CallbackWorld
    include ::Calabash::Cucumber::Operations

    def on_launch
      begin
        puts "Launching application"
      rescue Calabash::Cucumber::WaitHelpers::WaitError
        #May not appear so ignore timeout error
      end
    end
  end

  World do
    ::CallbackWorld.new
  end
end
