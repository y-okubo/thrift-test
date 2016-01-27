$LOAD_PATH.push('gen-rb')
$LOAD_PATH.unshift '../../lib/rb/lib'

require 'thrift'
require 'nekojarashi_engine'

# thrift-0.9.3.exe --gen rb nekojarashi.thrift
# デバッグは https://github.com/apache/thrift/blob/56e5b9b01b5a033306d583cd2aec07a0dda3c9f5/lib/rb/lib/thrift/processor.rb#L32 あたりの Exception を出力

class NekojarashiEngineHandler
  def backup_start
    puts 'call backup_start()'
  end

  def backup_status
    status = BackupStatus.new()
    status.short_value = 10
    status.int_value = 100
    status.long_value = 1000
    status.double_value = 0.12345
    status.bool_value = false
    status.string_value = 'センテンススプリング（卒論）'
    status.list_value = ['A', 'B']
    status.set_value = ['A', 'B']
    # status.map_value = {:a => 1, :b => 2} # Error
    status.map_value = {'a' => 1, 'b' => 2}
    
    return status
  end
end

handler = NekojarashiEngineHandler.new
processor = NekojarashiEngine::Processor.new(handler)
transport = Thrift::ServerSocket.new('127.0.0.1', 9090)
transportFactory = Thrift::BufferedTransportFactory.new
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

puts 'Starting the server...'
server.serve
puts 'done.'
