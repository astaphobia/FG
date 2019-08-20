package utils

import (
	"fmt"
	"strings"
	"time"

	"github.com/dgrijalva/jwt-go"
)

var (
	jwtKey = []byte("fckdmnsht")
)

type (
	TokenClaim struct {
		jwt.StandardClaims
	}
)

func (tkn *TokenClaim) GenerateToken(email string, password string) (*string, error) {
	tkn = &TokenClaim{
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: time.Now().Add(10 * time.Minute).Unix(),
			NotBefore: time.Now().Unix() - 1,
			IssuedAt:  time.Now().Unix(),
			Audience:  email,
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, tkn)
	tokenString, err := token.SignedString(jwtKey)
	if err != nil {
		return nil, err
	}

	return &tokenString, nil
}

func (tkn *TokenClaim) ParseToken(authorization string) error {
	if len(authorization) > 0 && strings.Contains(authorization, "Bearer") {
		tokenString := strings.TrimSpace(strings.Split(authorization, "Bearer")[1])
		jwtToken, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
			if jwt.GetSigningMethod("HS256") != token.Method {
				return nil, fmt.Errorf("Unexpected signing method: %v", token.Header["alg"])
			}
			return []byte(jwtKey), nil
		})
		if err != nil {
			return err
		}
		claim, ok := jwtToken.Claims.(*TokenClaim)
		if ok && jwtToken.Valid {
			tkn = claim
			return nil
		}
		return fmt.Errorf("failed parse token")
	}
	return fmt.Errorf("Bad token format")
}
