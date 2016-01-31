package main

import "fmt"

import "github.com/y-okubo/thrift-test/go/awesome_service"

type AwesomeServiceHandler struct {
}

func NewAwesomeServiceHandler() *AwesomeServiceHandler {
	return &AwesomeServiceHandler{}
}

func (p *AwesomeServiceHandler) SayHello() (err error) {
	fmt.Print("Hello!()\n")
	return nil
}

func (p *AwesomeServiceHandler) ListingTypes() (types *awesome_service.Types, err error) {
	return SharedTypes, nil
}
