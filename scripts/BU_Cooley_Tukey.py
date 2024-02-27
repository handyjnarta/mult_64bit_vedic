def BU_CT(A0, A1, Y, q):
    """
    Implementation of Butterfly Unit Cooley-Tukey
    A0 --------------[+]----- B0
                \   /
                 \ /
                 / \
                /   \ 
    A1 ---[x]--------[-]----- B1
    """

    M = A1*Y % q        # Barrett reduction

    B0 = (A0 + M) % q   # Modular Adder
    B1 = (A0 - M) % q   # Modular Subtractor
    return B0, B1

print(BU_CT(5000, 7000, 3000, 9000))