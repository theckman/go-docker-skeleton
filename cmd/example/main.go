package main

import (
	"github.com/gofrs/uuid"
	"github.com/theckman/go-docker-skeleton"
)

func main() {
	uuid, _ := uuid.NewV4() // always handle your errors
	print("You're successfully running the Docker Skeleton example program!\n")
	print("Invocation: " + uuid.String() + "\n")
	print("Package Version: " + dockerskeleton.Version + "\n")
	print("\nNow exiting with status 0, bye bye!\n")
}
