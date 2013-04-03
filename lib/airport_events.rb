require_relative 'airport_events/publisher'
require_relative 'airport_events/airport'
require_relative 'airport_events/kernel_log_parser'
require_relative 'airport_events/logger'

module AirportEvents
  class Watcher
    include Publisher

    def start
      Airport.ensure_airport_command!

      if Airport.connected?
        connected DateTime.now
      else
        disconnected DateTime.now
      end

      @kernel_log_parser = KernelLogParser.new

      @kernel_log_parser.subscribe :connected do |date|
        connected date
      end

      @kernel_log_parser.subscribe :disconnected do |date|
        disconnected date
      end
    end

    def on event, &blk
      subscribe event, &blk
    end

    private 

    def connected date
      publish :connected, Airport.ssid, date
    end

    def disconnected date
      publish :disconnected, date
    end

  end
end