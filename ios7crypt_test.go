package ios7crypt_test

import (
	"errors"
	"testing"
	"testing/quick"

	"github.com/mcandre/go-ios7crypt"
)

func TestDecryptInvalidHashTable(t *testing.T) {
	testCases := []struct {
		Expected error
		Input    string
	}{
		{errors.New("Hash missing seed digits"), ""},
		{errors.New("Hash seed eed fails to be non-negative"), "-1ffffffff"},
		{errors.New("Hash seed fails to parse as a decimal number in [0,16)"), "17ffffffff"},
		{errors.New("Hash fails to parse as a hexadecimal number ([0-9a-fA-F]{2}+)"), "00gg"},
	}

	for _, testCase := range testCases {
		_, observedErr := ios7crypt.Decrypt(testCase.Input)

		if observedErr == nil {
			t.Errorf("expected ios7crypt.Decrypt(%v) => (_, %v), got (_, nil)", testCase.Input, testCase.Expected)
		}
	}
}

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
