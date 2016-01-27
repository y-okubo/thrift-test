$:.push('gen-rb')
$:.unshift '../../lib/rb/lib'

require 'thrift'

require 'nekojarashi_engine'

begin
  port = ARGV[0] || 9090

  transport = Thrift::BufferedTransport.new(Thrift::Socket.new('127.0.0.1', 9090))
  protocol = Thrift::BinaryProtocol.new(transport)
  client = NekojarashiEngine::Client.new(protocol)

  transport.open()

  client.backup_start()
  print "backup_start()\n"

  status = client.backup_status()
  puts status.short_value

  transport.close()

rescue Thrift::Exception => tx
  print 'Thrift::Exception: ', tx.backtrace.join("\n"), "\n"
end