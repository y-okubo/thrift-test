// namespace java com.nekojarashi.thrift
namespace java thrift.sample

enum SystemType {
    WINDOWS,
    MAC_OS_X
}

struct Types {
  1: required i16 short_value;
  2: required i32 int_value;
  3: required i64 long_value;
  4: optional double double_value;
  5: optional bool bool_value;
  6: optional string string_value;
  7: optional list<string> list_value;
  8: optional set<string> set_value;
  9: optional map<string, i32> map_value;
}

service AwesomeService {
  void say_hello(),
  Types listing_types()
}
