#!/usr/bin/env sage
PT = 1234567890
print("PlainText is: {}".format(PT))
p = random_prime(2^32)
print("p = random_prime(2^32) = {}".format(p))
q = random_prime(2^32)
print("q = random_prime(2^32) = {}".format(q))
n = p*q
print("n = p*q = {}".format(n))
phi = (p-1)*(q-1)
print("phi = (p-1)*(q-1) = {}".format(phi))
e = random_prime(phi)
print("e = random_prime(phi) = {}".format(e))
d = xgcd(e,phi)[1]
print("d = xgcd(e,phi)[1] = {}".format(d))
print("Does d*e == 1?\n mod(d*e, phi) = {}".format(mod(d*e, phi)))
CT = power_mod(PT, e, n)
print("CipherText y = power_mod(x, e, n) = {}".format(CT))
DCT = power_mod(CT,d,n)
print("Decrypted CT is: {}".format(DCT))
