`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 16:35:45
// Design Name: 
// Module Name: Vedic_Barret_tb
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


module karatsuba_barrett_tb;

    // Inputs
    reg clk;        // Asynchronous clock
    reg [63:0] a;
    reg [63:0] b;
    reg [63:0] q;
    reg [30:0] mu;
    reg [7:0] k;

    // Outputs
    wire [63:0] t;

    // Instantiate the Vedic_Barrett module
    karatsuba_barrett uut (
        .clk(clk),
        .a(a),
        .b(b),
        .q(q),
        .mu(mu),
        .k(k),
        .t(t)
    );

    // Initial block for testbench
    initial begin
        clk = 0;    // Initialize clock
        a = 146712; // Replace with your desired input value
        b = 248912;
        q = 768112; // Replace with your desired input value
        mu = 1431447;
        k = 20;

        // Add a delay to allow the computation to complete
        #100;

        // Display results
        $display("Input a: %d", a);
        $display("Input b: %d", b);
        $display("Input q: %d", q);
        $display("Output t: %d", t);
        $finish; // Finish simulation
    end

    // Toggle clock for simulation
    always #5 clk = ~clk;

endmodule