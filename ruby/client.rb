$:.push('thrift')
$:.unshift '../../lib/rb/lib'

require 'thrift'

require 'awesome_service'

begin
  port = ARGV[0] || 9090

  transport = Thrift::BufferedTransport.new(Thrift::Socket.new('127.0.0.1', 9090))
  protocol = Thrift::BinaryProtocol.new(transport)
  client = AwesomeService::Client.new(protocol)

  transport.open()

  client.say_hello()
  print "say_hello()\n"

  types = client.listing_types()
  puts types.short_value

  transport.close()

rescue Thrift::Exception => tx
  print 'Thrift::Exception: ', tx.backtrace.join("\n"), "\n"
end
