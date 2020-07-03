#!/bin/bash
ls ../challenge/*.pem | xargs -I {} openssl rsa -in {} -pubin -modulus -noout | awk '{print substr($1 ,9)}' | xargs -I {} echo 'ibase=16; {}' | bc | tr -d '\\\n'
