airport-events
==============

airport-events is a MacOS specific library that receives WiFi related events. It currently supports:

```
**event**       **parameters**
connected       String ssid, DateTime date
disconnected    DateTime date
```

The library is extremely fresh and currently has no specs or documentation and has only been tested on MacOS 10.7.5. 

I created it to log the amount of time I spend on different WiFi networks. Check out the airport-log utility below for an example implementation.

Example uses:
-------------

* Detect when a machine has joined a specific network. 
* Log the amount of time that's spent on different networks.

Installation
------------
gem install airport-events

The gem depends on an official Apple command line tool called "airport" which is disabled by default. To enable the "airport" command, symlink it into PATH by running the following command: 

``
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/sbin/airport
``

Binary: airport-log
-----------

The gem is shipped with a binary called 'airport-log' which logs wifi connect/disconnect events to a json file.

For usage instructions run:
``airport-log -h``

