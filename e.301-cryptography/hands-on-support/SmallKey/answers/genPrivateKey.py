#!/usr/bin/env python3
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization
from cryptography import x509

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(a, m):
    gcd, x, y = egcd(a, m)
    if gcd != 1:
        return None  # modular inverse does not exist
    else:
        return x % m

n = 8464481006489090994506453371545747140045883416875197642486592854169 
p = 2209828846356855715679030504831459
#p = 3830378547390089828095201542724691
e = 3

q = int(n // p)
phi_n = (p-1)*(q-1)

d = modinv(e, phi_n)
dmp1 = rsa.rsa_crt_dmp1(d, p)
dmq1 = rsa.rsa_crt_dmq1(d, q)
iqmp = rsa.rsa_crt_iqmp(p, q)
pn = rsa.RSAPublicNumbers(e, n)
compositen = rsa.RSAPrivateNumbers(p, q, d, dmp1, dmq1, iqmp, pn)
compositek = compositen.private_key(backend=default_backend())
pem = compositek.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.TraditionalOpenSSL,
        encryption_algorithm=serialization.NoEncryption()
        )
f = open("privateSmallKey.pem", "wb")
f.write(pem)
f.close()
