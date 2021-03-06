#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'awesome_service_types'

module AwesomeService
  class Client
    include ::Thrift::Client

    def say_hello()
      send_say_hello()
      recv_say_hello()
    end

    def send_say_hello()
      send_message('say_hello', Say_hello_args)
    end

    def recv_say_hello()
      result = receive_message(Say_hello_result)
      return
    end

    def listing_types()
      send_listing_types()
      return recv_listing_types()
    end

    def send_listing_types()
      send_message('listing_types', Listing_types_args)
    end

    def recv_listing_types()
      result = receive_message(Listing_types_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'listing_types failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_say_hello(seqid, iprot, oprot)
      args = read_args(iprot, Say_hello_args)
      result = Say_hello_result.new()
      @handler.say_hello()
      write_result(result, oprot, 'say_hello', seqid)
    end

    def process_listing_types(seqid, iprot, oprot)
      args = read_args(iprot, Listing_types_args)
      result = Listing_types_result.new()
      result.success = @handler.listing_types()
      write_result(result, oprot, 'listing_types', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class Say_hello_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Say_hello_result
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Listing_types_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class Listing_types_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Types}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

