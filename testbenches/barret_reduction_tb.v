//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2024 16:38:17
// Design Name: 
// Module Name: barrett_reduction_tb
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

`timescale 1ns/1ps


module barrett_reduction_tb;

    // Inputs
    reg clk;            // Asynchronous clock
    reg rst;            // Synchronous reset
    reg [127:0] z;
    reg [63:0] q;
    reg [7:0] mu;
    reg [13:0] r;

    // Outputs
    wire [63:0] t;

    // Instantiate the Barrett_Reduction module
    Barrett_Reduction uut (
        .clk(clk),      // Connect clk to the module
        .rst(rst),      // Connect rst to the module
        .z(z),
        .q(q),
        .mu(mu),
        .t(t)
    );

    // Initial block for testbench
    initial begin
        clk = 0;        // Initialize clk
        rst = 1;        // Assert synchronous reset
        #5;             // Wait a few time units
        rst = 0;        // Deassert synchronous reset

        $dumpfile("barrett_reduction_tb.vcd");
        $dumpvars(0,barrett_reduction_tb);
        // Test case 1
        z = 3651363; // Replace with your desired input value
        q = 7681; // Replace with your desired input value
        r = 8192;
        mu = 8736;

        // Add a delay to allow the computation to complete
        #10;

        // Display results
        $display("Input z: %d", z);
        $display("Input q: %d", q);
        $display("Input r: %d", r);
        $display("Output t: %d", t);
        $finish;        // Finish simulation
    end

    // Toggle clock for simulation
    always #5 clk = ~clk;

endmodule
