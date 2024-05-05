`timescale 1ns / 1ps

module karatsuba_barrett (
    input wire clk,       // Asynchronous clock input
    input [63:0] a,
    input [63:0] b,
    input [63:0] q,
    input [30:0] mu,
    input [7:0] k,
    output [63:0] t
);

    wire [127:0] result;

    // Instantiate modules
    karatsuba64 mult1 (
        .clk(clk),    // Connect clk to the module
        .x(a[63:0]),
        .y(b[63:0]),
        .product(result[127:0])
    );

    Barrett_Reduction br1 (
        .clk(clk),    // Connect clk to the module
        .z(result[127:0]),
        .q(q[63:0]),
        .mu(mu[30:0]),
        .k(k[7:0]),
        .t(t[63:0])
    );

endmodule