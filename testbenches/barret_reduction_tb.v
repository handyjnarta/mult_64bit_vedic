`timescale 1ns/1ps
`include "../rtl/Barrett_Reduction.v"

module barrett_reduction_tb;

    // Inputs
    reg [127:0] z;
    reg [63:0] q;

    // Outputs
    wire [63:0] t;

    // Instantiate the Barrett_Reduction module
    Barrett_Reduction uut (
        .z(z),
        .q(q),
        .t(t)
    );

    // Initial block for testbench
    initial begin

        $dumpfile("barrett_reduction_tb.vcd");
        $dumpvars(0,barrett_reduction_tb);
        // Test case 1
        z = 3651363; // Replace with your desired input value
        q = 7681; // Replace with your desired input value

        // Add a delay to allow the computation to complete
        #10;

        // Display results
        $display("Input z: %d", z);
        $display("Input q: %d", q);
        $display("Output s: %d", t);
    end

endmodule
