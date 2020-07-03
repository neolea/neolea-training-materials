#!/bin/bash
# Then take the header apart
head -n 4 d4-logo.ppm > header.txt
tail -n +5 d4-logo.ppm > body.bin
# Then encrypt with ECB (experiment with some different keys)
openssl enc -aes-128-ecb -nosalt -pass pass:"ANNA" -in body.bin -out body.ecb.bin
# And finally put the result together and convert to some better format with Gimp
cat header.txt body.ecb.bin > d4-logo.ecb.ppm3
