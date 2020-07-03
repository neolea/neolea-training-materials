# e.301-cryptography
This folder contains the training material for e.301 cryptography.

## Presentation support

The presentation support were created using LaTeX: the main document `soc.tex`
is compiled into `soc.pdf`.  During the presentation, trainees are invited to
solve several challenges, or hands-on exercices. These exercises are located in
the `hands-on` folder and go through several primers about cryptography use and
workarounds:

- in `GPG_sessions` trainees learn to use GPG, understand its functioning and
  the value of session keys,

- in `UsingRSA` trainees are exposed step by step, to the construcition of RSA
  keys and their use, using sage and OpenSSL,

- in `SmallKey` trainees learn how to find out the primes numbers used in a
  small RSA key, and to reconstruct a working private key.   

- in `ClosePQ` trainees learn that cryptography can sometime be vulnerable
  because of bad choices made when building keys. They use Fermat theorem to
break a RSA key which have too prime numbers too close from one another.

- in `SharedPrimeFactor` trainees are presented with another RSA vulnerability:
  the sharing of cryptographic material. They need to solve a challenge to
understand its principle.

- in `MISPexport` trainees learn how use a feed of compromised cryptographic
  materials provided by the D4 project into a MISP instance. They are tasked
with the duty of identifying which vendors should be notified of their
vulnerabilities.

- in `TLSinspection` trainees are shown how to decrypt a TLS session using
  materials they cracked using D4-Snake-Oil-Crypto.


## Snake oil crypto and D4 project

https://github.com/d4-project/snake-oil-crypto is part of D4 project and used
to scale up the exploitation of the last vulnerability seen during the
training. Trainees are shown a full D4-SOC chain where cryptocraphic materials
are collected from an HTTPS connection (to an host known to be vulnerable),
tested for their robustness, eventually cracked. A private key is then built
and used in wireshark to decipher the previously captured TLS connection.

