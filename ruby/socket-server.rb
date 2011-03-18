#!/usr/bin/ruby

  require 'socket'
  
  socket = UDPSocket.new
  socket.bind("127.0.0.1", 12121)#socketi dinlemeye al
  
  while 1
    trap('INT') { $stderr.puts "Cikiyorum"; exit 1 }
    mesaj, gonderen = socket.recvfrom(100)
    host = gonderen[3]
    puts "#{Time.now}: #{host} '#{mesaj}'"
  end

