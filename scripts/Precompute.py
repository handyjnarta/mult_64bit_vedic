import math

a = int(input("Input a = "))
b = int(input("Input b = "))
q = int(input("Input q = "))

# Pre-computation
k = math.ceil(math.log2(q)) # number of bits in q
k1 = len(bin(q))
r = 2**k
mu = r**2 // q

# Multiplication
z = a * b

# Print the values
print("k =", k)
# print("k1 =", k1)
print("mu =", mu)
print("z =", z)

print("Expected ", (a*b)%q)