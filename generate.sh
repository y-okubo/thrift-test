thrift -r -out ruby/thrift --gen rb awesome_service.thrift
thrift -r -out java/src/main/java --gen java:fullcamel awesome_service.thrift
thrift -r -out go --gen go awesome_service.thrift
