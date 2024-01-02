`timescale 1ns/1ps

module Barrett_Reduction(
    input [127:0] z,
    input [63:0] q,
    output [63:0] r
);

    // Pre-computation
    // k = math.ceil(math.log2(q)) # number of bits in q
    wire [6:0] k;
    // r = 2**k
    // mu = r**2 // q

    // # Multiplication
    // z = a * b

    // # Barrett reduction
    // m1 = z // r
    // m2 = m1 * mu
    // m3 = m2 // r
    // t = z - m3 * q
    // if t >= q:
    //     return t - q
    // else:
    //     return t
endmodule