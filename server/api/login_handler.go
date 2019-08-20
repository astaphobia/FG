package api

import (
	"context"
	"fmt"

	"github.com/astaphobia/grpc-flutter/server/utils"
)

func (a *API) PostLogin(context context.Context, in *LoginRequest) (*LoginResponse, error) {
	var (
		token utils.TokenClaim
	)

	if len(in.Email) < 1 && len(in.Password) < 1 {
		return nil, fmt.Errorf("Email and password is required")
	}

	token = utils.TokenClaim{}
	tokenString, err := token.GenerateToken(in.Email, in.Password)
	if err != nil {
		return nil, fmt.Errorf("There's something error: %v", err)
	}
	tknString := *tokenString
	return &LoginResponse{
		Token: tknString,
	}, nil
}
