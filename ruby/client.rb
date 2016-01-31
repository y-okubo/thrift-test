$:.push('thrift')
$:.unshift '../../lib/rb/lib'

require 'thrift'

require 'awesome_service'

begin
  port = ARGV[0] || 9090

  transport = Thrift::BufferedTransport.new(Thrift::Socket.new('127.0.0.1', 9090))
  protocol = Thrift::JsonProtocol.new(transport)
  client = AwesomeService::Client.new(protocol)

  transport.open()

  client.say_hello()
  print "say_hello()\n"

  avg = 0
  10.times {
    start_time = Time.now
    types = client.listing_types()
    puts Time.now - start_time
    avg += Time.now - start_time
  }
  puts "Average: #{avg / 10}"

  transport.close()

rescue Thrift::Exception => tx
  print 'Thrift::Exception: ', tx.backtrace.join("\n"), "\n"
end
