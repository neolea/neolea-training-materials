#!/bin/bash
openssl rsa -in $1 -pubin -modulus -noout | awk '{print substr($1 ,9)}' | xargs -I {} echo 'ibase=16; {}' | bc | tr -d '\\\n' 
