  def set_simulated_device(simulated_device)
    current_simulated_device = `defaults read com.apple.iphonesimulator "SimulateDevice"`.chomp

    if current_simulated_device != simulated_device
      simulator_pid = `ps -ax|awk '/[i]Phone Simulator.app\\/Contents\\/MacOS\\/iPhone Simulator/{print $1}'`.chomp
      Process.kill('INT', simulator_pid.to_i) unless simulator_pid.empty?
      `defaults write com.apple.iphonesimulator "SimulateDevice" '"#{simulated_device}"'`
    end
  end

  set_simulated_device("iPhone Retina (4-inch)")
  defaults read com.apple.iphonesimulator "iPhone Retina (4-inch)"