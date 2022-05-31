package main

/*
#cgo CFLAGS: -I../host/
#cgo LDFLAGS: -L../host/ -L/opt/openenclave/lib/openenclave/host -Wl,-z,noexecstack -lhost -loehost -ldl -lpthread -lssl -lcrypto

#include "host.h"
*/
import "C"
import "fmt"

func main() {
    fmt.Println("")

	C.create_enclave()
	defer C.terminate_enclave()

    C.call_enclave()
}
