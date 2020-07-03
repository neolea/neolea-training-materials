#!/bin/bash
openssl rsa -in ../smallkey.pem -pubin -modulus -noout
