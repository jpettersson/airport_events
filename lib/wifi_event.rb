require 'date'

require_relative 'wifi_event/ssid'
require_relative 'wifi_event/echo'
require_relative 'wifi_event/logger'
require_relative 'wifi_event/kernel_log_parser'

module WifiEvent
  class Watcher

    def initialize(observer)
      @observer = observer
      @kernel_log_parser = KernelLogParser.new(self)

      #connected 'beluga', DateTime.now
      #disconnected DateTime.now
    end

    def handle_event event, date
      if event == :connected
        connected SSID.get, date
      elsif event == :disconnected
        disconnected date
      end
    end

    private 

    def connected(ssid, date)
      @observer.connected ssid, date
    end

    def disconnected(date)
      @observer.disconnected date
    end

  end
end