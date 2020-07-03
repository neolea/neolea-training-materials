#!/bin/bash
for i in `cat toCrack.txt` 
do
ruby<<EOF
p "$i".to_i(16).to_i()
EOF
done
