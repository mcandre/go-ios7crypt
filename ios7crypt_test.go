package ios7crypt_test

import (
	"testing"
	"testing/quick"

	"github.com/mcandre/go-ios7crypt"
)

func TestSymmetricEncryption(t *testing.T) {
	symmetricProperty := func(s string) bool {
		hash, err := ios7crypt.Encrypt(s)

		if err != nil {
			return false
		}

		password, err := ios7crypt.Decrypt(hash)

		if err != nil {
			return false
		}

		return password == s
	}

	err := quick.Check(symmetricProperty, nil)

	if err != nil {
		t.Error(err)
	}
}
