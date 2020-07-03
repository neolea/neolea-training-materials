#!/bin/bash
idgg=$(gpg --batch --with-colons --gen-key key-params1 | head -n1 | grep -o -P '(?<=key ).*(?= marked)')
idbg=$(gpg --batch --with-colons --gen-key key-params2 | head -n1 | grep -o -P '(?<=key ).*(?= marked)')
gpg --encrypt -u "$idgg" --armor --yes -r good.guy@bisounours.fr --output ../irrelevant.asc to_encrypt_irrelevant 
gpg --encrypt -u "$idbg" --armor --yes -r good.guy@bisounours.fr --output ../relevant.asc to_encrypt_relevant 
gpg --delete-secret-key "$idbg"
gpg --delete-key "$idbg"
