def Mod_Add(A, B, q):
    M = A + B
    if (M > q):
        M = M - q
    
    return M

print(Mod_Add(512831, 71923, 31238))