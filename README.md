# Super simple HTTP(S) Proxy

This is a super simple HTTP/HTTPS proxy - designed to be distributed as a self-contained binary that can be dropped in
anywhere and run.

Originally code by <https://github.com/jthomperoo/simple-proxy>
Code based on the guide here: <https://medium.com/@mlowicki/http-s-proxy-in-golang-in-less-than-100-lines-of-code-6a51c2f2c38c>

## Features

- HTTP and HTTPS
- Can choose which port to run on
- Can specify paths to certificate and private key file to use
- Can log each proxied connection
- Basic authentication
- Can log request headers
- Can log failed authentication attempt details
- Printing version number

## Install

You can download the latest release for your architecture and operating system from [the releases
page](https://github.com/un1c0rn-unkn0wn/super-simple-proxy/releases).

Once you unzip the release package you can either run the binary directly, or you can add it into your PATH so it can
be called from anywhere.

## How to build

Developing this project requires these dependencies:

* [Go](https://golang.org/doc/install) >= `1.22`
* [Static Check](https://github.com/dominikh/go-tools) == `2023.1 (v0.4.0)`

### Commands

* `make` - builds the binaries.
* `make test` - runs the unit tests.
* `make lint` - lints the code.
* `make format` - formats the code, must be run to pass the CI.
* `make zip` - zips the code for distribution along with the license.

## Usage

You can download the binary and run the program directly (it is fully self contained).

## Options

The program has the following options, you can see this list by using the `--help` flag.

```bash
Usage of super-simple-proxy:
  -basic-auth string
        basic auth, format username:password, no auth if not provided
  -bind string
        IP address to bind the proxy server to (default "0.0.0.0")
  -cert string
        path to cert file (eg. fullchain.pem)
  -key string
        path to key file (eg. privkey.pem)
  -log-auth
        log failed proxy auth with IP (eg. for fail2ban)
  -log-headers
        log headers
  -port string
        port to listen on (default "8888")
  -protocol string
        proxy protocol (http or https) (default "http")
  -timeout int
        timeout in seconds (default 10)
  -version
        prints current version
```

## Checking the proxy is working

You can use [cURL](https://curl.se/) on Windows/Linux/MacOS systems to check if your proxy is working:

```bash
curl --proxy 'http://localhost:8888' 'https://www.random.org/integers/?num=1&min=1&max=5&col=1&base=10&format=plain&rnd=new'
```

This will reach out to [random.org](https://www.random.org) to fetch a random number, using the default proxy address
and port.