`timescale 1ns/1ps

module Barrett_Reduction(
    input [127:0] z,
    input [63:0] q,
    input [7:0] mu,
    input [13:0] r,
    output reg [63:0] t
);

    // Pre-computation
    // k = math.ceil(math.log2(q)) # number of bits in q
    //wire [7:0] k = $clog2(q)

    // r = 2**k
    //wire [63:0] r = 1 << k;

    // mu = r**2 // q
    //wire [63:0] mu = r * r / q;

    // # Multiplication
    // z = a * b

    // # Barrett reduction
    // m1 = z // r
    wire [127:0] m1 = z >> r;

    // m2 = m1 * mu
    wire [127:0] m2 = m1 * mu;

    // m3 = m2 // r
    wire [127:0] m3 = m2 >> r;

    // t = z - m3 * q
    always @* begin
        t = z - m3 * q;
    end


    // if t >= q:
    //     return t - q
    // else:
    //     return t
    always @* begin
    if (t >= q) begin
            // r = t - q
        t = t - q;
    end
    end

endmodule
