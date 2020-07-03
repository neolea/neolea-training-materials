#!/bin/bash
while read line
do
ruby<<EOF
p "$line".to_i(16).to_i()
EOF
done < "${1:-/dev/stdin}"
