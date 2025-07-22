VERSION=v0.1a

default:
	@echo "=============Building binaries============="

	# Linux 386
	CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_386/simplest-proxy main.go
	cp LICENSE dist/linux_386/LICENSE

	# Linux amd64
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_amd64/simplest-proxy main.go
	cp LICENSE dist/linux_amd64/LICENSE

	# Linux arm
	CGO_ENABLED=0 GOOS=linux GOARCH=arm go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_arm/simplest-proxy main.go
	cp LICENSE dist/linux_arm/LICENSE

	# Linux arm64
	CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_arm64/simplest-proxy main.go
	cp LICENSE dist/linux_arm64/LICENSE

	# Darwin amd64
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/darwin_amd64/simplest-proxy main.go
	cp LICENSE dist/darwin_amd64/LICENSE

	# Darwin arm64
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/darwin_arm64/simplest-proxy main.go
	cp LICENSE dist/darwin_arm64/LICENSE

	# FreeBSD 386
	CGO_ENABLED=0 GOOS=freebsd GOARCH=386 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/freebsd_386/simplest-proxy main.go
	cp LICENSE dist/freebsd_386/LICENSE

	# FreeBSD amd64
	CGO_ENABLED=0 GOOS=freebsd GOARCH=amd64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o -o dist/freebsd_amd64/simplest-proxy main.go
	cp LICENSE dist/freebsd_amd64/LICENSE

	# FreeBSD arm
	CGO_ENABLED=0 GOOS=freebsd GOARCH=arm go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/freebsd_arm/simplest-proxy main.go
	cp LICENSE dist/freebsd_arm/LICENSE

	# FreeBSD arm64
	CGO_ENABLED=0 GOOS=freebsd GOARCH=arm64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/freebsd_arm64/simplest-proxy main.go
	cp LICENSE dist/freebsd_arm64/LICENSE

	# Linux mips-softfloat
	CGO_ENABLED=0 GOOS=linux GOARCH=mips GOMIPS=softfloat go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_mips_sf/simplest-proxy main.go
	cp LICENSE dist/linux_mips_sf/LICENSE

	# Linux mips-hardfloat
	CGO_ENABLED=0 GOOS=linux GOARCH=mips GOMIPS=hardfloat go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_mips_hf/simplest-proxy main.go
	cp LICENSE dist/linux_mips_hf/LICENSE

	# Linux mipsle-softfloat
	CGO_ENABLED=0 GOOS=linux GOARCH=mipsle GOMIPS=softfloat go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_mipsle_sf/simplest-proxy main.go
	cp LICENSE dist/linux_mipsle_sf/LICENSE

	# Linux mipsle-hardfloat
	CGO_ENABLED=0 GOOS=linux GOARCH=mipsle GOMIPS=hardfloat go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_mipsle_hf/simplest-proxy main.go
	cp LICENSE dist/linux_mipsle_hf/LICENSE

	# Linux mips64
	CGO_ENABLED=0 GOOS=linux GOARCH=mips64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_mips64/simplest-proxy main.go
	cp LICENSE dist/linux_mips64/LICENSE

	# Linux mips64le
	CGO_ENABLED=0 GOOS=linux GOARCH=mips64le go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/linux_mips64le/simplest-proxy main.go
	cp LICENSE dist/linux_mips64le/LICENSE

	# Windows 386
	CGO_ENABLED=0 GOOS=windows GOARCH=386 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/windows_386/simplest-proxy.exe main.go
	cp LICENSE dist/windows_386/LICENSE

	# Windows amd64
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/windows_amd64/simplest-proxy.exe main.go
	cp LICENSE dist/windows_amd64/LICENSE

	# Windows arm64
	CGO_ENABLED=0 GOOS=windows GOARCH=arm64 go build -ldflags="-s -w -X 'main.Version=$(VERSION)'" -o dist/windows_arm64/simplest-proxy.exe main.go
	cp LICENSE dist/windows_arm64/LICENSE

zip:
	@echo "=============Zipping binaries============="
	zip -r -j dist/simplest-proxy_linux_386.zip dist/linux_386
	zip -r -j dist/simplest-proxy_linux_amd64.zip dist/linux_amd64
	zip -r -j dist/simplest-proxy_linux_arm.zip dist/linux_arm
	zip -r -j dist/simplest-proxy_linux_arm64.zip dist/linux_arm64
	zip -r -j dist/simplest-proxy_darwin_amd64.zip dist/darwin_amd64
	zip -r -j dist/simplest-proxy_darwin_arm64.zip dist/darwin_arm64
	zip -r -j dist/simplest-proxy_windows_386.zip dist/windows_386
	zip -r -j dist/simplest-proxy_windows_amd64.zip dist/windows_amd64
	zip -r -j dist/simplest-proxy_windows_arm64.zip dist/windows_arm64
	zip -r -j dist/simplest-proxy_freebsd_386.zip dist/freebsd_386
	zip -r -j dist/simplest-proxy_freebsd_amd64.zip dist/freebsd_amd64
	zip -r -j dist/simplest-proxy_freebsd_arm.zip dist/freebsd_arm
	zip -r -j dist/simplest-proxy_freebsd_arm64.zip dist/freebsd_arm64
	zip -r -j dist/simplest-proxy_linux_mips_sf.zip dist/linux_mips_sf
	zip -r -j dist/simplest-proxy_linux_mips_hf.zip dist/linux_mips_hf
	zip -r -j dist/simplest-proxy_linux_mipsle_sf.zip dist/linux_mipsle_sf
	zip -r -j dist/simplest-proxy_linux_mipsle_hf.zip dist/linux_mipsle_hf
	zip -r -j dist/simplest-proxy_linux_mips64.zip dist/linux_mips64
	zip -r -j dist/simplest-proxy_linux_mips64le.zip dist/linux_mips64le

lint:
	@echo "=============Linting============="
	staticcheck ./...

format:
	@echo "=============Formatting============="
	gofmt -s -w .
	go mod tidy

test:
	@echo "=============Running unit tests============="
	go test ./...
