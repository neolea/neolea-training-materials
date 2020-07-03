n = 8464481006489090994506453371545747140045883416875197642486592854169
print("Factorizing n = {}".format(n))
p, q = factor(n)
print("p = {}".format(p[0]))
print("q = {}".format(q[0]))
print("{} * {} = {}".format(p[0], q[0], p[0]*q[0]))
