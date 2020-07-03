#!/bin/bash
ls ../challenge/*.pem | xargs -I {} openssl rsa -in {}  -pubin -modulus -noout | sed 's/Modulus=//g' > toCrack.txt
