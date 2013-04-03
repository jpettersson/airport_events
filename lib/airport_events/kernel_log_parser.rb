require 'file-tail'
require 'date'

module AirportEvents
  class KernelLogParser
    include Publisher

    def initialize
      Thread.new do
        File.open('/var/log/kernel.log') do |log|
          log.extend(File::Tail)
          log.interval = 10
          log.backward(0)
          log.tail do |line| 

            if event = match_event(line)
              publish event, DateTime.strptime(line[0..15], '%b %d %H:%M:%S')
            end
          end
        end
      end
    end

    def match_event line
      if line.match /AirPort: Link Up.*/
        :connected
      elsif line.match /AirPort: Link Down.*/
        :disconnected
      end
    end
  end
end