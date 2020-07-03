lattice(n,nearp,howclose,t,k):
  R.<x> = PolynomialRing(ZZ)
  f = howclose*x+nearp
  M = matrix(t)
  for i in range(t):
    M[i] = (f^i*n^max(k-i,0)).coeffs()+[0]*(t-1-i)
  M = M.LLL()
  Q = sum(z*(x/howclose)^i for i,z in enumerate(M[0]))
  for r,multiplicty in Q.roots():
    if nearp+r > 0:
      g = gcd(n,nearp+r)
      if g > 1

     

