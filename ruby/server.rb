$LOAD_PATH.push('thrift')
$LOAD_PATH.unshift '../../lib/rb/lib'

require 'thrift'
require 'awesome_service'

# thrift-0.9.3.exe --gen rb nekojarashi.thrift
# デバッグは https://github.com/apache/thrift/blob/56e5b9b01b5a033306d583cd2aec07a0dda3c9f5/lib/rb/lib/thrift/processor.rb#L32 あたりの Exception を出力

class AwesomeServiceHandler
  def initialize
    @types = Types.new
    @types.short_value = 200
    @types.int_value = 100
    @types.long_value = 1000
    @types.double_value = 0.12345
    @types.bool_value = false
    @types.string_value = 'AAA'
    @types.list_value = %w(A B)
    @types.set_value = %w(A B)
    @types.map_value = Hash.new
    for i in 1..50000 do
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
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts 'Starting the server...'
server.serve
puts 'done.'
