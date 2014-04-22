AirportEvents
=============

A MacOS specific Ruby library that receives WiFi related events from the system.

<table>
  <caption>Currently supported events</caption>
  <tr>
    <td>Event</td>
    <td>Parameters</td>
    <td>Triggers when</td>
  </tr>
  <tr>
    <td>connected</td>
    <td>String ssid, DateTime date</td>
    <td>A WiFi network has been successfully connected</td>
  </tr>
  <tr>
    <td>disconnected</td>
    <td>DateTime date</td>
    <td>Computer is going to sleep, airport has been disabled or system halts</td>
  </tr>
</table>

The library has only been tested on MacOS 10.7.5.

It was created to log the amount of time I spend on different WiFi networks. Check out the airport-log utility below for an example implementation.

Why?
-------------

* Detect when a machine has joined a specific network. 
* Log the amount of time that's spent on different networks.

Installation
------------
``
gem install airport_events
``

The gem depends on an official Apple command line tool called "airport" which is disabled by default. To enable the "airport" command, symlink it into PATH by running the following command: 

``
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport
``

Example Usage
-----

```ruby
require 'airport_events'

# Create a new Watcher instance and set up some event listeners.
watcher = AirportEvents::Watcher.new

watcher.on :connected do |ssid, date|
  puts "Connected to #{ssid} on #{date}"
end

watcher.on :disconnected do |date|
  puts "Disconnected on #{date}"
end

# Start the watcher, which runs in a separate Thread.
watcher.start

# Keep program alive until interrupted (For instance: CTRL + C).
interrupted = false
trap("INT") { interrupted = true }

while true do
  exit if interrupted
  sleep 0.1
end

```

airport-log
-----------

The gem is shipped with a command called 'airport-log' which logs wifi connect/disconnect events to a JSON file.

For usage instructions run:
``airport-log -h``

Example JSON output:

```json
[
  {
    "ssid": "orca",
    "connected_at": "2013-02-24T22:35:54+00:00",
    "disconnected_at": "2013-02-24T22:47:38-05:00"
  },
  {
    "ssid": "beluga",
    "connected_at": "2013-02-24T22:48:23-05:00",
    "disconnected_at": null
  }
]
```

Note: When disconnected_at is null it means the network is still connected or a disconnect event was never sent.
