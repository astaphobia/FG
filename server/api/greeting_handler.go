package api

import (
	"context"
	"fmt"
)

func (a *API) GetGreeting(context context.Context, r *GreetingRequest) (*GreetingResponse, error) {
	return &GreetingResponse{
		Greeting: fmt.Sprintf("Hi %v, Welcome To GRPC", r.FullName),
	}, nil
}
