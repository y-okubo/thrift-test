package main

import "fmt"

import "github.com/y-okubo/thrift-test/go/awesome_service"

type AwesomeServiceHandler struct {
	MapValue map[string]int32
}

func NewAwesomeServiceHandler() *AwesomeServiceHandler {
	return &AwesomeServiceHandler{MapValue: make(map[string]int32)}
}

func (p *AwesomeServiceHandler) SayHello() (err error) {
	fmt.Print("Hello!()\n")
	return nil
}

func (p *AwesomeServiceHandler) ListingTypes() (types *awesome_service.Types, err error) {
	types = awesome_service.NewTypes()
	var f float64 = 100
	var b bool = false
	var s string = "のまねこ"
	types.ShortValue = 100
	types.IntValue = 100
	types.LongValue = 100
	types.DoubleValue = &f
	types.BoolValue = &b
	types.StringValue = &s
	types.ListValue = []string{"a", "b", "c", "d"}
	types.SetValue = map[string]bool{"go": true, "rb": false, "js": true}
	types.MapValue = p.MapValue

	return types, nil
}
