#!/bin/bash
openssl rsa -in $1 -pubin -modulus -noout | awk '{print substr($1 ,9)}' | ./convert10.sh
