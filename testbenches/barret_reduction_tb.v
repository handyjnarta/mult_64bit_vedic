`timescale 1ns/1ps
`include "../rtl/Barrett_Reduction.v"

module barrett_reduction_tb;

    // Inputs
    reg [127:0] z;
    reg [63:0] q;
    reg [7:0] mu;
    reg [13:0] r;

    // Outputs
    wire [63:0] t;

    // Instantiate the Barrett_Reduction module
    Barrett_Reduction uut (
        .z(z),
        .q(q),
        .mu(mu),
        .r(r),
        .t(t)
    );

    // Initial block for testbench
    initial begin

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
    end

endmodule
