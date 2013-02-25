module AirportEvents
  class Airport
    def self.ssid
      parse_ssid(run_info_command)
    end

    def self.connected?
      ssid.length > 0
    end

    def self.run_info_command
      %x(airport -I 2>&1)
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