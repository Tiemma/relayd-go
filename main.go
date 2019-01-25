package main

import (
    "fmt"
    "net/http"
    "log"
)

func HelloServer(w http.ResponseWriter, req *http.Request) {
    w.Header().Set("Content-Type", "text/plain")
    w.Write([]byte("This is an example server.\n"))
}

func main() {
    tlsHost := "localhost:9443"
    host := "localhost:8443"
    fmt.Printf("Server started on " + host)
    fmt.Printf("Server started on " + tlsHost)
    http.HandleFunc("/", HelloServer)
    err := http.ListenAndServe(host, nil)
    tlsErr := http.ListenAndServeTLS(tlsHost, "server.crt", "server.key", nil)
    if err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
    if tlsErr != nil {
        log.Fatal("ListenAndServe: ", tlsErr)
    }

}
