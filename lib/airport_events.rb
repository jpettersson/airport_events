require_relative 'airport_events/event_dispatcher'
require_relative 'airport_events/airport'
require_relative 'airport_events/kernel_log_parser'
require_relative 'airport_events/logger'

module AirportEvents
  class Watcher
    include EventDispatcher

    def start
      if Airport.connected?
        connected DateTime.now
      else
        disconnected DateTime.now
      end

      @kernel_log_parser = KernelLogParser.new

      @kernel_log_parser.bind :connected do |date|
        connected date
      end

      @kernel_log_parser.bind :disconnected do |date|
        disconnected date
      end
    end

    private 

    def connected date
      trigger :connected, Airport.ssid, date
    end

    def disconnected date
      trigger :disconnected, date
    end

  end
end