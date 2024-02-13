def Mod_Add(A, B, q):
    M = A + B
    if (M > q):
        M = M - q
    
    return M