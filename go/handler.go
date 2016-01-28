package main

import "fmt"
import "github.com/y-okubo/thrift-test/go/nekojarashi"

type NekojarashiEngineHandler struct {
}

func NewNekojarashiEngineHandler() *NekojarashiEngineHandler {
	return &NekojarashiEngineHandler{}
}

func (p *NekojarashiEngineHandler) BackupStart() (err error) {
	fmt.Print("ping()\n")
	return nil
}

func (p *NekojarashiEngineHandler) BackupStatus() (status *nekojarashi.BackupStatus, err error) {
	status = nekojarashi.NewBackupStatus()
	status.ShortValue = 100
	return status, nil
}
