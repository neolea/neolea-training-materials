#!/bin/bash
# Run show_key.sh to get the session key
# Paste it between the quote in the gpg command below
GREEN="\\033[1;32m"
DEFAULT="\\033[0;39m"
echo -e $GREEN"Attempting to decrypt relevant.asc using a session key"$DEFAULT
gpg --override-session-key '' -d ../relevant.asc
