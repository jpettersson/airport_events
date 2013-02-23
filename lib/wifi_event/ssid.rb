module WifiEvent
  class SSID
    def self.get
      result = parse(run_command)
    end

    def self.run_command
      %x(airport -I 2>&1)
    end

    def self.parse result
      if result.match /\sSSID: /
        result[/\sSSID: (.*?)\n/, 1].inspect
      else
        raise "Airport command not found or SSID could not be read!"
      end
    end
  end
end