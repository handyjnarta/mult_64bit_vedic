module Vedic_Barrett (
    a, b, q, t
);
    input [63:0] a;
    input [63:0] b;
    input [63:0] q;
    output [63:0] t;

    wire [127:0] r_mult;

    mult_64bit mult1(a[63:0], b[63:0], r_mult[127:0]);
    Barrett_Reduction br1(r_mult[127:0], q[63:0], t[63:0]);

endmodule