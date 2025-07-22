package main

import (
	"crypto/tls"
	"flag"
	"fmt"
	"net/http"
	"os"
	"proxy/proxy"
	"time"
)

var (
	Version = "v1.0a"
)

const (
	httpProtocol  = "http"
	httpsProtocol = "https"
)

func init() {
	//	flag.Set("logtostderr", "true")
}

func main() {
	var version bool
	flag.BoolVar(&version, "version", false, "prints current version")
	var protocol string
	flag.StringVar(&protocol, "protocol", httpProtocol, "proxy protocol (http or https)")
	var bind string
	flag.StringVar(&bind, "bind", "0.0.0.0", "IP address to bind the proxy server to")
	var port string
	flag.StringVar(&port, "port", "8888", "port to listen on")
	var certPath string
	flag.StringVar(&certPath, "cert", "", "path to cert file (eg. fullchain.pem)")
	var keyPath string
	flag.StringVar(&keyPath, "key", "", "path to key file (eg. privkey.pem)")
	var basicAuth string
	flag.StringVar(&basicAuth, "basic-auth", "", "basic auth, format username:password, no auth if not provided")
	var logAuth bool
	flag.BoolVar(&logAuth, "log-auth", false, "log failed proxy auth with IP (eg. for fail2ban)")
	var logHeaders bool
	flag.BoolVar(&logHeaders, "log-headers", false, "log headers")
	var timeoutSecs int
	flag.IntVar(&timeoutSecs, "timeout", 10, "timeout in seconds")
	flag.Parse()

	if version {
		fmt.Println(Version)
		os.Exit(0)
	}

	if protocol != httpProtocol && protocol != httpsProtocol {
		fmt.Fprintln(os.Stdout, "[ERROR]: Protocol must be http or https")
		//fmt.Fprintln(os.Stderr, "[ERROR]: Protocol must be http or https")
		os.Exit(1)
	}

	if protocol == httpsProtocol && (certPath == "" || keyPath == "") {
		fmt.Fprintln(os.Stdout, "[ERROR]: Options --cert and --key are required")
		//fmt.Fprintln(os.Stderr, "[ERROR]: Options --cert and --key are required")
		os.Exit(1)
	}

	var handler http.Handler
	if basicAuth == "" {
		handler = &proxy.ProxyHandler{
			Timeout:    time.Duration(timeoutSecs) * time.Second,
			LogAuth:    logAuth,
			LogHeaders: logHeaders,
		}
	} else {
		//Search for user and pass credentials
		var user, pass string
		foundDelimiter := false

		for _, char := range basicAuth {
			if char == ':' {
				foundDelimiter = true
				continue
			}
			if foundDelimiter {
				pass += string(char)
			} else {
				user += string(char)
			}
		}

		if !foundDelimiter || user == "" || pass == "" {
			fmt.Fprintln(os.Stdout, "[ERROR]: Invalid auth format provided")
			//fmt.Fprintln(os.Stderr, "[ERROR]: Invalid auth format provided")
			os.Exit(1)
		}

		parts := []string{user, pass}
		handler = &proxy.ProxyHandler{
			Timeout:    time.Duration(timeoutSecs) * time.Second,
			Username:   &parts[0],
			Password:   &parts[1],
			LogAuth:    logAuth,
			LogHeaders: logHeaders,
		}
	}

	server := &http.Server{
		Addr:    fmt.Sprintf("%s:%s", bind, port),
		Handler: handler,
		// Disable HTTP/2.
		TLSNextProto: make(map[string]func(*http.Server, *tls.Conn, http.Handler)),
	}

	if protocol == httpProtocol {
		fmt.Fprintln(os.Stdout, "[INFO]: Starting HTTP proxy...")
		fmt.Fprintln(os.Stdout, server.ListenAndServe())
	} else {
		fmt.Fprintln(os.Stdout, "[INFO]: Starting HTTPS proxy...")
		fmt.Fprintln(os.Stdout, server.ListenAndServeTLS(certPath, keyPath))
	}
}
