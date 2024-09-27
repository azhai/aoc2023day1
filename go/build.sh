#!/bin/bash

GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o ../bin/day1-go *.go
