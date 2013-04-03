module AirportEvents
  module Publisher

    module InstanceMethods
      def subscribe(event, &blk)
        if subscribers[event].nil?
          subscribers[event] = Array.new
        end

        subscribers[event].push blk
      end

      def publish(event, *args)
        unless subscribers[event].nil?
          subscribers[event].each do |blk|
            blk.call *args
          end
        end
      end

      def subscribers
        @subscribers ||= Hash.new
      end
    end

    def self.included(base)
      base.send :include, InstanceMethods
    end

  end
end