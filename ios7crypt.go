package ios7crypt

import (
	"bytes"
	"crypto/rand"
	"encoding/hex"
	"errors"
	"fmt"
	"math/big"
	"strconv"
)

const Version = "0.0.1"

var xlat = [...]byte{0x64, 0x73, 0x66, 0x64, 0x3b, 0x6b, 0x66, 0x6f, 0x41, 0x2c, 0x2e, 0x69, 0x79, 0x65, 0x77, 0x72, 0x6b, 0x6c, 0x64, 0x4a, 0x4b, 0x44, 0x48, 0x53, 0x55, 0x42, 0x73, 0x67, 0x76, 0x63, 0x61, 0x36, 0x39, 0x38, 0x33, 0x34, 0x6e, 0x63, 0x78, 0x76, 0x39, 0x38, 0x37, 0x33, 0x32, 0x35, 0x34, 0x6b, 0x3b, 0x66, 0x67, 0x38, 0x37}

func Xlat(index int) byte {
	return xlat[index%len(xlat)]
}

func Encrypt(password string) string {
	seedBig, err := rand.Int(rand.Reader, big.NewInt(16))

	if err != nil {
		panic(err)
	}

	seed := int(seedBig.Int64())

	var hashBuffer bytes.Buffer

	hashBuffer.WriteString(fmt.Sprintf("%02d", seed))

	plainBytes := []byte(password)

	for i, plainByte := range plainBytes {
		keyByte := Xlat(seed + i)
		cipherByte := plainByte ^ keyByte
		hashBuffer.WriteString(fmt.Sprintf("%02x", cipherByte))
	}

	return hashBuffer.String()
}

func Decrypt(hash string) (string, error) {
	if len(hash) < 2 {
		return "", errors.New("Hash missing seed digits")
	}

	seedString := hash[:2]

	seed, err := strconv.Atoi(seedString)

	if err != nil {
		return "", errors.New("Hash seed fails to parse as a decimal number in [0, 16)")
	}

	var passwordBuffer bytes.Buffer

	for i := 0; i < (len(hash)-2)/2; i++ {
		hexPair := hash[i*2+2 : i*2+4]
		cipherBytes, err := hex.DecodeString(hexPair)

		if err != nil {
			panic(err)
		}

		cipherByte := cipherBytes[0]
		keyByte := Xlat(seed + i)
		plainByte := cipherByte ^ keyByte

		passwordBuffer.WriteByte(plainByte)
	}

	return passwordBuffer.String(), nil
}
