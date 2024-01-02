# Modular Multiplication by Barrett Reduction

import math

def modMult(a, b, q):
    # input : a, b, q
    # output: a x b mod q

    # Pre-computation
    k = math.ceil(math.log2(q)) # number of bits in q
    r = 2**k
    mu = r**2 // q

    # Multiplication
    z = a * b

    # Barrett reduction
    m1 = z // r
    m2 = m1 * mu
    m3 = m2 // r
    t = z - m3 * q
    if t >= q:
        return t - q
    else:
        return t
    
# Test 1
a = 1467
b = 2489
q = 7681

print(a,"x", b, "mod", q, "=", modMult(a, b, q))
