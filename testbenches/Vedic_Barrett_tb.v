`timescale 1ns/1ps
`include "../rtl/Barrett_Reduction.v"
`include "../rtl/full_adder.v"
`include "../rtl/full_adder4bit.v"
`include "../rtl/ha.v"
`include "../rtl/half_adder.v"
`include "../rtl/mult_2bit.v"
`include "../rtl/mult_4bit.v"
`include "../rtl/mult_8bit.v"
`include "../rtl/mult_16bit.v"
`include "../rtl/mult_32bit.v"
`include "../rtl/mult_64bit.v"
`include "../rtl/rca_4bit.v"
`include "../rtl/rca_8bit.v"
`include "../rtl/rca_16bit.v"
`include "../rtl/rca_32bit.v"
`include "../rtl/rca_64bit.v"
`include "../rtl/Vedic_Barrett.v"

module Vedic_Barrett_tb;

    // Inputs
    reg [63:0] a;
    reg [63:0] b;
    reg [63:0] q;
    reg [30:0] mu;
    reg [7:0] k;

    // Outputs
    wire [63:0] t;

    // Instantiate the Barrett_Reduction module
    Vedic_Barrett uut (
        .a(a),
        .b(b),
        .q(q),
        .mu(mu),
        .k(k),
        .t(t)
    );

    // Initial block for testbench
    initial begin

        $dumpfile("Vedic_Barrett_tb.vcd");
        $dumpvars(0,Vedic_Barrett_tb);
        // Test case 1
        a = 146712; // Replace with your desired input value
        b = 248912;
        q = 768112; // Replace with your desired input value
        mu = 1431447;
        k = 20;

        // Add a delay to allow the computation to complete
        #10;

        // Display results
        $display("Input a: %d", a);
        $display("Input b: %d", b);
        $display("Input q: %d", q);
        $display("Output t: %d", t);
    end 

endmodule
