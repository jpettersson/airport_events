require 'json'
require 'logger'

OUT = Logger.new(STDOUT)

module AirportEvents
  class Logger

    def initialize path
      @log_path = path
      read_log

      watcher = AirportEvents::Watcher.new
      
      watcher.on :connected do |ssid, date|
        connected ssid, date
      end

      watcher.on :disconnected do |date|
        disconnected date
      end

      watcher.start

      interrupted = false
      trap("INT") { interrupted = true }

      while true do
        exit if interrupted
        sleep 0.1
      end

    end

    def connected ssid, date
      if last_entry
        unless last_entry[:ssid] == ssid
          new_entry ssid, date
        else
          OUT.info "AirportLogger: Already connected to to \"#{ssid}\""
        end
      else
        new_entry ssid, date
      end
    end

    def disconnected date
      end_last_entry date
    end

    def read_log
      @log = read_file
    end

    def read_file 
      if file = File.read(@log_path, mode: 'a+')
        if file.length > 0
          JSON.parse(file, :symbolize_names => true)
        else
          []
        end
      end
    end

    def rewrite
      IO.write(@log_path, JSON.pretty_generate(@log))
      read_log
    end

    def append entry
      @log.push entry
      rewrite
    end

    def last_entry
      entry = @log.last
      if entry and entry[:disconnected_at].nil?
        return entry
      end
    end

    def new_entry ssid, date
      OUT.info "AirportLogger: Connected to \"#{ssid}\""
      append({
        :ssid => ssid,
        :connected_at => date,
        :disconnected_at => nil
      })
    end

    def end_last_entry date
      if last_entry and last_entry[:disconnected_at].nil?
        OUT.info "AirportLogger: Disconnected"
        last_entry[:disconnected_at] = date
        rewrite
      end
    end

  end
end