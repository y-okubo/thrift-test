package main

import "fmt"

import "github.com/y-okubo/thrift-test/go/nekojarashi"

type NekojarashiEngineHandler struct {
	MapValue map[string]int32
}

func NewNekojarashiEngineHandler() *NekojarashiEngineHandler {
	return &NekojarashiEngineHandler{MapValue: make(map[string]int32)}
}

func (p *NekojarashiEngineHandler) BackupStart() (err error) {
	fmt.Print("ping()\n")
	return nil
}

func (p *NekojarashiEngineHandler) BackupStatus() (status *nekojarashi.BackupStatus, err error) {
	status = nekojarashi.NewBackupStatus()
	var f float64 = 100
	var b bool = false
	var s string = "のまねこ"
	status.ShortValue = 100
	status.IntValue = 100
	status.LongValue = 100
	status.DoubleValue = &f
	status.BoolValue = &b
	status.StringValue = &s
	status.ListValue = []string{"a", "b", "c", "d"}
	status.SetValue = map[string]bool{"go": true, "rb": false, "js": true}
	status.MapValue = p.MapValue

	return status, nil
}
