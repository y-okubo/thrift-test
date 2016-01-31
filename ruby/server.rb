$LOAD_PATH.push('thrift')
$LOAD_PATH.unshift '../../lib/rb/lib'

require 'thrift'
require 'awesome_service'

class AwesomeServiceHandler
  def initialize
    @types = Types.new
    @types.short_value = 1
    @types.int_value = 1
    @types.long_value = 1
    @types.double_value = 1.0
    @types.bool_value = true
    @types.string_value = 'A'
    @types.list_value = %w(A)
    @types.set_value = %w(A)
    @types.map_value = Hash.new
    for i in 0..49999 do
      @types.map_value.store(i.to_s, i)
    end
  end

  def say_hello
    puts 'call say_hello()'
  end

  def listing_types
    return @types
  end
end

handler = AwesomeServiceHandler.new
processor = AwesomeService::Processor.new(handler)
transport = Thrift::ServerSocket.new('127.0.0.1', 9090)
transportFactory = Thrift::BufferedTransportFactory.new
protocolFactory = Thrift::JsonProtocolFactory.new
server = Thrift::SimpleServer.new(processor, transport, transportFactory, protocolFactory)

puts 'Starting the server...'
server.serve
puts 'done.'
