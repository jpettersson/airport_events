Gem::Specification.new do |s|
  s.name        = 'wifi_event'
  s.version     = '0.0.1'
  s.date        = '2013-02-23'
  s.summary     = "Detect changes in WiFi network associations on MacOS"
  s.description = "Detect and log changes in WiFi network associations on MacOS. Utilizing the build in, but hidden 'airport' command."
  s.authors     = ["Jonathan Pettersson"]
  s.email       = 'jonathan@spacetofu.com'
  s.files       = ["lib/wifi_event.rb", "lib/wifi_event/ssid.rb", "lib/wifi_event/kernel_log_parser.rb", "lib/wifi_event/logger.rb", "lib/wifi_event/echo.rb"]
  s.homepage    = 'http://rubygems.org/gems/wifilog'
  s.executables << 'wifilog'
end