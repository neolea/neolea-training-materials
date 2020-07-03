#!/bin/bash
echo -e  "\e[32m Checking Generated Private Key:\e[0m " 
openssl rsa -in privateSmallKey.pem -text -check -noout
echo -e  "\e[32m Generating Public Key:\e[0m " 
openssl pkey -in privateSmallKey.pem -pubout -outform pem
echo -e  "\e[32m Cat Original Public Key:\e[0m " 
cat ../smallkey.pem
