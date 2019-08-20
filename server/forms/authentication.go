package forms

type (
	AuthManual struct {
		Email    string `form:"email" json:"email"`
		Password string `form:"password" json:"password"`
	}
	AuthSocMed struct {
		Email string `form:"email" json:"email"`
	}
)
