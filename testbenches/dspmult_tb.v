`timescale 1ns/1ps

module testbench_multiplier_64bit;

reg clk, rst;
reg [63:0] operand_a, operand_b;
wire [127:0] result;

// Instantiate the multiplier module
multiplier_64bit uut (
    .operand_a(operand_a),
    .operand_b(operand_b),
    .result(result)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test stimulus
initial begin
    // Initialize inputs
    operand_a = 64'b1010101010101010;
    operand_b = 64'b1100110011001100;
    rst = 1;

    // Apply reset
    #10 rst = 0;

    // Wait for a few clock cycles
    #20;

    // Display initial values
    $display("Time = %0t, Operand A = %b, Operand B = %b", $time, operand_a, operand_b);

    // Apply new values
    operand_a = 64'b1111000011110000;
    operand_b = 64'b0101010101010101;

    // Display new values
    $display("Time = %0t, Operand A = %b, Operand B = %b", $time, operand_a, operand_b);

    // Wait for a few clock cycles
    #20;

    // Apply reset
    rst = 1;

    // Display final result
    $display("Time = %0t, Result = %b", $time, result);

    // Stop simulation
    #10 $finish;
end

endmodule
