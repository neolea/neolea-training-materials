from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization
import csv

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

with open("./vulnerableKeys.csv", "r", encoding="utf-8") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    l = open("../attempt/list", "w")
    for row in csv_reader:
        n = int(row[0], 10)
        p = int(row[1], 10)
        key = '{}'.format(row[2])
        q = int(n // p)
        phi_n = (p-1)*(q-1)
        with open("../challenge/"+key+".pem", "rb") as key_file:
            pk = serialization.load_pem_public_key(
            key_file.read(),
            backend=default_backend()
            )
            kpun = pk.public_numbers()
            d = modinv(kpun.e, phi_n)
            if d != None:
                dmp1 = rsa.rsa_crt_dmp1(d, p)
                dmq1 = rsa.rsa_crt_dmq1(d, q)
                iqmp = rsa.rsa_crt_iqmp(p, q)
                compositen = rsa.RSAPrivateNumbers(p, q, d, dmp1, dmq1, iqmp, kpun)
                compositek = compositen.private_key(backend=default_backend())
                pem = compositek.private_bytes(
                    encoding=serialization.Encoding.PEM,
                    format=serialization.PrivateFormat.TraditionalOpenSSL,
                    encryption_algorithm=serialization.NoEncryption()
                    )
                f = open("../attempt/private-"+key+".pem", "wb")
                f.write(pem)
                l.write("{}\n".format(key))
                f.close()
    l.close()
