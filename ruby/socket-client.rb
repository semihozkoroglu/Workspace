#!/usr/bin/ruby

  require 'socket'
  log = UDPSocket.new
  log.connect("127.0.0.1", 12121)
  log.print "Evveeettt!"

