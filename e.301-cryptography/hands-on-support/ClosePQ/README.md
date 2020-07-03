# How close is too close?
- if \(\rm\:|p-q| < n^{1/3},\:\)
- then n can factored in polynomial time using fermat algorithm:

```python
def fermatfactor(N):
  if N <= 0: return [N]
  if is_even(N): return [2,N/2]
  a = ceil(sqrt(N))
  while not is_square(a^2-N):
    a = a + 1
  b = sqrt(a^2-N)
  return [a - b,a + b]
```
# Instructions
This folders contains two public keys:
- `veryclosepq.pem`
- `notsoclosepq.pem` 

Use the provided algorithm to factor n.

A detailed explanation of this method can be found [on Daniel's Bernstein website](https://facthacks.cr.yp.to/fermat.html), or [John D. Cooks's](https://www.johndcook.com/blog/2018/10/28/fermat-factoring/).
