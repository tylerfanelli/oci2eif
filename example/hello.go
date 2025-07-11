package main

import (
		"fmt"
)

func main() {
	var name string

	fmt.Print("Enter name: ")

	fmt.Scanln(&name)

	fmt.Printf("Hello from a nitro enclave, %s!\n", name)
}
