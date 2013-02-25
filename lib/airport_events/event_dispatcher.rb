module AirportEvents
  module EventDispatcher

    module InstanceMethods
      def bind(event, &blk)
        if observers[event].nil?
          observers[event] = Array.new
        end

        observers[event].push blk
      end

      # TODO: unbind
      #def unbind
      #
      #end

      def trigger(event, *args)
        unless observers[event].nil?
          observers[event].each do |blk|
            blk.call *args
          end
        end
      end

      def observers
        @observers ||= Hash.new
      end
    end

    def self.included(base)
      base.send :include, InstanceMethods
    end

  end
end