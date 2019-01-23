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
    fmt.Printf("Server started on localhost:443")
    http.HandleFunc("/", HelloServer)
    err := http.ListenAndServeTLS("localhost:443", "server.crt", "server.key", nil)
    if err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}
