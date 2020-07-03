#!/bin/bash
gpg --encrypt -u 7346BCE0EEAC5409B47BE752B765C0223147AB84 --armor -r good.guy@bisounours.fr --output ../to_encrypt_irrelevant.asc to_encrypt_irrelevant 
gpg --encrypt -u 98ECC1675D23659E7F0A6D541E5EB847F2F46B99 --armor -r good.guy@bisounours.fr --output ../to_encrypt_relevant.asc to_encrypt_relevant 
