#
# Autogenerated by Thrift Compiler (0.9.3)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'

module SystemType
  WINDOWS = 0
  MAC_OS_X = 1
  VALUE_MAP = {0 => "WINDOWS", 1 => "MAC_OS_X"}
  VALID_VALUES = Set.new([WINDOWS, MAC_OS_X]).freeze
end

class Types
  include ::Thrift::Struct, ::Thrift::Struct_Union
  SHORT_VALUE = 1
  INT_VALUE = 2
  LONG_VALUE = 3
  DOUBLE_VALUE = 4
  BOOL_VALUE = 5
  STRING_VALUE = 6
  LIST_VALUE = 7
  SET_VALUE = 8
  MAP_VALUE = 9

  FIELDS = {
    SHORT_VALUE => {:type => ::Thrift::Types::I16, :name => 'short_value'},
    INT_VALUE => {:type => ::Thrift::Types::I32, :name => 'int_value'},
    LONG_VALUE => {:type => ::Thrift::Types::I64, :name => 'long_value'},
    DOUBLE_VALUE => {:type => ::Thrift::Types::DOUBLE, :name => 'double_value', :optional => true},
    BOOL_VALUE => {:type => ::Thrift::Types::BOOL, :name => 'bool_value', :optional => true},
    STRING_VALUE => {:type => ::Thrift::Types::STRING, :name => 'string_value', :optional => true},
    LIST_VALUE => {:type => ::Thrift::Types::LIST, :name => 'list_value', :element => {:type => ::Thrift::Types::STRING}, :optional => true},
    SET_VALUE => {:type => ::Thrift::Types::SET, :name => 'set_value', :element => {:type => ::Thrift::Types::STRING}, :optional => true},
    MAP_VALUE => {:type => ::Thrift::Types::MAP, :name => 'map_value', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::I32}, :optional => true}
  }

  def struct_fields; FIELDS; end

  def validate
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field short_value is unset!') unless @short_value
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field int_value is unset!') unless @int_value
    raise ::Thrift::ProtocolException.new(::Thrift::ProtocolException::UNKNOWN, 'Required field long_value is unset!') unless @long_value
  end

  ::Thrift::Struct.generate_accessors self
end
