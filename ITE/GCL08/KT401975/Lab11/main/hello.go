package main

import (
	"fmt"
	"net/http"
)

func main() {
	handler := http.NewServeMux()
	handler.HandleFunc("/api/hello", Hello)
	http.ListenAndServe("0.0.0.0:8080", handler)
	// Listen to all request to port 8080.
}

func Hello(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `Hello world`)
}