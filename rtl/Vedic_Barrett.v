`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 15:44:54
// Design Name: 
// Module Name: Vedic_Barrett
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Vedic_Barrett (
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
    vedic_64_dsp mult1 (
        .clk(clk),    // Connect clk to the module
        .a(a[63:0]),
        .b(b[63:0]),
        .result(result[127:0])
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
