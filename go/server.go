package main

import (
	"fmt"
	"strconv"

	"git.apache.org/thrift.git/lib/go/thrift"
	"github.com/y-okubo/thrift-test/go/awesome_service"
)

func runServer(transportFactory thrift.TTransportFactory, protocolFactory thrift.TProtocolFactory, addr string, secure bool) error {
	var transport thrift.TServerTransport
	var err error
	transport, err = thrift.NewTServerSocket(addr)

	if err != nil {
		return err
	}
	fmt.Printf("Transport: %T\n", transport)
	handler := NewAwesomeServiceHandler()

	var i int32
	var j int = 0
	for i = 0; i < 50000; i++ {
		handler.MapValue[strconv.Itoa(j)] = i
		j++
	}

	processor := awesome_service.NewAwesomeServiceProcessor(handler)
	server := thrift.NewTSimpleServer4(processor, transport, transportFactory, protocolFactory)

	fmt.Println("Starting the simple server... on ", addr)
	return server.Serve()
}
