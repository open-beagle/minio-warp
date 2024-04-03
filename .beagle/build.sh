#!/bin/sh

set -x

export CGO_ENABLED=0

git apply .beagle/v0.9-mod.patch

export GOARCH=amd64
go build -ldflags '-w -s' -a -o dist/warp-linux-$GOARCH .

export GOARCH=arm64
go build -ldflags '-w -s' -a -o dist/warp-linux-$GOARCH .

git apply -R .beagle/v0.9-mod.patch