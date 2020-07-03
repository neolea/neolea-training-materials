#!/bin/bash
for i in `more ../attempt/list`
do
	 openssl rsautl -inkey ../attempt/private-$i.pem -decrypt < ../challenge/$i.bin
done
