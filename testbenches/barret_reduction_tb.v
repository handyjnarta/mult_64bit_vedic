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


module Barrett_Reduction_tb;

    // Inputs
    reg clk;            // Asynchronous 
    reg [127:0] z;
    reg [63:0] q;
    reg [30:0] mu;
    reg [7:0] k;

    // Outputs
    wire [63:0] t;

    // Instantiate the Barrett_Reduction module
    Barrett_Reduction uut (
        .clk(clk),      // Connect clk to the 
        .z(z),
        .q(q),
        .mu(mu),
        .k(k),
        .t(t)
    );

    // Initial block for testbench
    initial begin
        clk = 0;        // Initialize 
        #1             // Wait a few time 

//        $dumpfile("barrett_reduction_tb.vcd");
//        $dumpvars(0,barrett_reduction_tb);
        // Test case 1
        z = 365183773; // Replace with your desired input value
        q = 768112; // Replace with your desired input value
        mu = 1431447;
        k = 20;

        // Add a delay to allow the computation to complete
        # 2;
        z = 365183661; // Replace with your desired input value
        q = 768009; // Replace with your desired input value
        mu = 1431447;
        k = 20;
        
        # 2;
        z = 365183654; // Replace with your desired input value
        q = 768018; // Replace with your desired input value
        mu = 1431447;
        k = 20;
        
        # 2;
        z = 365183545; // Replace with your desired input value
        q = 768099; // Replace with your desired input value
        mu = 1431447;
        k = 20;

        # 10
        // Display results
        $display("Input z: %d", z);
        $display("Input q: %d", q);
        $display("Input mu: %d", mu);
        $display("Output t: %d", t);
        $finish;        // Finish simulation
    end

    // Toggle clock for simulation
    always #1 clk = ~clk;

endmodule