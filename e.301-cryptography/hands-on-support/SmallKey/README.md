# Instructions
## Factorization basics

This directory contains a sample public key `smallkey.pem`. 
* what is the key size of smallkey?
* what is n?
* what is the public exponent?
* what is n in base10?
* what are p and q?

Use `openssl` to answer these questions. You can get some help by reading the rsa section of `openssl` manual:
```shell
man openssl rsa
```

The most important flags are the following:
* `-in`  to specify which file to read,
* `-pubin` to specify that openssl will read a public key,
* `-modulus` to get the key modulus in base 16 (rsa' n)
* `-text` to get textual information,
* `-noout` to remove the key content from the output,

```shell
openssl rsa -in smallkey.pem -pubin
```

To crack--so factorize--this key, you can use sagemath's `factor` [function](http://doc.sagemath.org/html/en/reference/structure/sage/structure/factorization.html).

Check out the different scripts in the answer folder to have example of how to
manipulate `openssl` outputs.

You can also check
[sagemath tutorial about integer factorization](http://doc.sagemath.org/html/en/thematic_tutorials/explicit_methods_in_number_theory/integer_factorization.html) that details other factorization methods
included in sage that are more efficient than `factor`.

## Building the private key out of the factorization results

[Python cryptography library](https://cryptography.io/en/latest/hazmat/primitives/asymmetric/rsa/) can be used to build a RSA private key from the prime
numbers you just computed, follow rsa.sage script that we ran earlier to get an
overview of the different steps you should follow.

Check out the answers folder for example if needed.
