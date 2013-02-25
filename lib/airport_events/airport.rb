module AirportEvents
  class Airport
    INFO_COMMAND = "airport -I 2>&1"

    def self.ensure_airport_command
      run_info_command
      unless $?.exitstatus == 0
        raise "Fatal: the 'airport' command is not in PATH. Run 'airport-log help' for instructions."
      end
    end

    def self.ssid
      parse_ssid(run_info_command)
    end

    def self.connected?
      ssid.length > 0
    end

    def self.run_info_command
      %x(#{INFO_COMMAND})
    end

    def self.parse_ssid result
      if result.match /\sSSID: /
        result[/\sSSID: (.*?)\n/, 1]
      else
        ""
      end
    end
  end
end