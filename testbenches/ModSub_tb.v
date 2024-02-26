`timescale 1ns / 1ps
`include "../rtl/ModSub.v"

// ModSub_tb.v
module ModSub_tb;

  // Parameters
  parameter BIT_SIZE = 4;
  parameter CLK_PERIOD = 10;

  // Inputs
  reg clk;
  reg rstn;
  reg [BIT_SIZE - 1:0] A;
  reg [BIT_SIZE - 1:0] B;
  reg [BIT_SIZE - 1:0] q;

  // Outputs
  wire [BIT_SIZE - 1:0] M;

  // Instantiate the ModSub module
  ModSub #(BIT_SIZE) uut (
    .clk(clk),
    .rstn(rstn),
    .A(A),
    .B(B),
    .q(q),
    .M(M)
  );

  // Clock generation
  always #((CLK_PERIOD / 2)) clk = ~clk;

  // Initial block
  initial begin
    // Initialize inputs
    clk = 0;
    rstn = 1;
    A = 8;   // Example value, modify as needed
    B = 3;   // Example value, modify as needed
    q = 2;   // Example value, modify as needed

    // Apply reset
    rstn = 0;
    #((2 * CLK_PERIOD)) rstn = 1;

    // Test case 1
    #((2 * CLK_PERIOD)) A = 8;
    #((2 * CLK_PERIOD)) B = 3;
    #((2 * CLK_PERIOD)) q = 2;
    #((2 * CLK_PERIOD)) $display("Test Case 1: A=%d, B=%d, q=%d, M=%d", A, B, q, M);

    // Stop simulation
    #((2 * CLK_PERIOD)) $stop;
  end

endmodule
