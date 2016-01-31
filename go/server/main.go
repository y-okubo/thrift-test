package main

import (
	"flag"
	"fmt"
	"os"
	"strconv"

	"git.apache.org/thrift.git/lib/go/thrift"
	"github.com/y-okubo/thrift-test/go/awesome_service"
)

var SharedTypes *awesome_service.Types

func runServer(transportFactory thrift.TTransportFactory, protocolFactory thrift.TProtocolFactory, addr string, secure bool) error {
	var transport thrift.TServerTransport
	var err error
	transport, err = thrift.NewTServerSocket(addr)
	if err != nil {
		return err
	}
	fmt.Printf("Transport: %T\n", transport)

	handler := NewAwesomeServiceHandler()

	SharedTypes = awesome_service.NewTypes()
	var f float64 = 1
	b := true
	s := "A"
	SharedTypes.ShortValue = 1
	SharedTypes.IntValue = 1
	SharedTypes.LongValue = 1
	SharedTypes.DoubleValue = &f
	SharedTypes.BoolValue = &b
	SharedTypes.StringValue = &s
	SharedTypes.ListValue = []string{"A"}
	SharedTypes.SetValue = map[string]bool{"A": true}
	SharedTypes.MapValue = make(map[string]int32)
	// var i int32
	for i := 0; i < 50000; i++ {
		SharedTypes.MapValue[strconv.Itoa(i)] = int32(i)
	}

	processor := awesome_service.NewAwesomeServiceProcessor(handler)
	server := thrift.NewTSimpleServer4(processor, transport, transportFactory, protocolFactory)

	fmt.Println("Starting the simple server... on ", addr)
	return server.Serve()
}

func usage() {
	fmt.Fprint(os.Stderr, "Usage of ", os.Args[0], ":\n")
	flag.PrintDefaults()
	fmt.Fprint(os.Stderr, "\n")
}

func main() {
	flag.Usage = usage
	// server := flag.Bool("server", false, "Run server")
	protocol := flag.String("P", "json", "Specify the protocol (binary, compact, json, simplejson)")
	framed := flag.Bool("framed", false, "Use framed transport")
	buffered := flag.Bool("buffered", false, "Use buffered transport")
	addr := flag.String("addr", "127.0.0.1:9090", "Address to listen to")
	secure := flag.Bool("secure", false, "Use tls secure transport")

	flag.Parse()

	var protocolFactory thrift.TProtocolFactory
	switch *protocol {
	case "compact":
		protocolFactory = thrift.NewTCompactProtocolFactory()
	case "simplejson":
		protocolFactory = thrift.NewTSimpleJSONProtocolFactory()
	case "json":
		protocolFactory = thrift.NewTJSONProtocolFactory()
	case "binary", "":
		protocolFactory = thrift.NewTBinaryProtocolFactoryDefault()
	default:
		fmt.Fprint(os.Stderr, "Invalid protocol specified", protocol, "\n")
		usage()
		os.Exit(1)
	}

	var transportFactory thrift.TTransportFactory
	if *buffered {
		transportFactory = thrift.NewTBufferedTransportFactory(8192)
	} else {
		transportFactory = thrift.NewTTransportFactory()
	}

	if *framed {
		transportFactory = thrift.NewTFramedTransportFactory(transportFactory)
	}

	if err := runServer(transportFactory, protocolFactory, *addr, *secure); err != nil {
		fmt.Println("error running server:", err)
	}
}
