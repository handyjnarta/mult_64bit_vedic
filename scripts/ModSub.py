def Mod_Sub(A, B, q):
    M = A - B
    if (M < 0):
        M = M + q
    
    return M

print(Mod_Sub(4, 5, 10))