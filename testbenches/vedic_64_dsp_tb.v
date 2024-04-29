`timescale 1ns / 1ps
// File: vedic_64_dsp_tb.v
module vedic_64_dsp_tb;

  // Declare signals for UUT inputs and outputs
    reg CLK;
    reg [63:0] a;
    reg [63:0] b;
    wire [127:0] result;

    // Instantiate the vedic_64_dsp module
    vedic_64_dsp uut (
        .CLK(CLK),
        .a(a),
        .b(b),
        .result(result)
    );

    // Clock generation
    always begin
        #1 CLK = ~CLK;
    end

    // Initialize inputs
    initial begin
        CLK = 0;
        a = 64'd123456789;
        b = 64'd125;

        // Wait for a few clock cycles
        #20;

        // Display the result
        $display("Result: %h", result);
        $finish;
    end
endmodule
