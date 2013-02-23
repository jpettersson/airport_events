module WifiEvent
  class Echo

    def initialize
      @watcher = WifiEvent::Watcher.new(self)
    end

    def connected ssid, date
      puts "WifiEvent: Connected to #{ssid} at #{date}."
    end

    def disconnected date
      puts "WifiEvent: Disconnected at #{date}."
    end
  end
end