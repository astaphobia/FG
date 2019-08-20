package main

import (
	"context"
	"fmt"
	"log"
	"net"

	"github.com/astaphobia/grpc-flutter/server/api"
	"github.com/astaphobia/grpc-flutter/server/utils"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

func main() {
	list, err := net.Listen("tcp", ":777")
	if err != nil {
		log.Fatalf("Failed open TCP network: %v", err)
	}

	serve := api.API{}
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(serverInterceptor),
	)

	api.RegisterGreetingServer(grpcServer, &serve)
	api.RegisterLoginServer(grpcServer, &serve)

	if err := grpcServer.Serve(list); err != nil {
		log.Fatalf("Failed create grpc connection: %v", err)
	}
}

func serverInterceptor(
	ctx context.Context,
	req interface{},
	info *grpc.UnaryServerInfo,
	handler grpc.UnaryHandler) (interface{}, error) {
	fmt.Println(info)
	if info.FullMethod != "/api.Login/PostLogin" {
		if err := authorize(ctx); err != nil {
			return nil, err
		}
	}

	h, err := handler(ctx, req)

	return h, err
}

func authorize(ctx context.Context) error {
	md, ok := metadata.FromIncomingContext(ctx)
	if !ok {
		return status.Errorf(codes.InvalidArgument, "Retrieving metadata is failed")
	}
	authHeader, ok := md["authorization"]
	if !ok {
		return status.Errorf(codes.Unauthenticated, "Authorization token is not supplied")
	}

	token := authHeader[0]
	tokenClaims := utils.TokenClaim{}
	err := tokenClaims.ParseToken(token)
	if err != nil {
		return status.Errorf(codes.Unauthenticated, "Invalid token format")
	}
	return nil
}
