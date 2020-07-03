# http://facthacks.cr.yp.to/batchgcd.html

import csv

def batchgcd_faster(X):
    prods = producttree(X)
    R = prods.pop()
    while prods:
        X = prods.pop()
        R = [R[floor(i // 2)] % X[i] ** 2 for i in range(len(X))]
    return [gcd(r // n, n) for r, n in zip(R, X)]

def producttree(X):
    result = [X]
    while len(X) > 1:
        X = [prod(X[i * 2:(i + 1) * 2]) for i in range((len(X) + 1) // 2)]
        result.append(X)
    return result

def remaindersusingproducttree(n, T):
    result = [n]
    for t in reversed(T):
        result = [result[floor(i // 2)] % t[i] for i in range(len(t))]
    return result

def remainders(n, X):
    return remaindersusingproducttree(n, self.producttree(X))

with open("toCrack10.csv", "r", encoding="utf-8") as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    moduli = [ZZ(line[0]) for line in csv_reader]
    csv_file.seek(0)
    csv_reader = csv.reader(csv_file, delimiter=',')
    files = [line[1] for line in csv_reader]
    res = batchgcd_faster(moduli)
    match = [x for x in zip(moduli, res, files) if x[1] != 1 and x[0] != x[1]]

with open('vulnerableKeys.csv','w') as out:
    csv_out = csv.writer(out)
    for row in match:
        csv_out.writerow(row)
