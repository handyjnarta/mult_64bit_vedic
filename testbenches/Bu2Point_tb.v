`timescale 1ns/1ns
`include "../rtl/Bu2Point.v"

module Bu2Point_tb;

  // Parameters
  parameter BIT_SIZE = 60;

  // Inputs
  reg clk;
  reg rstn;
  reg [BIT_SIZE - 1:0] A0;
  reg [BIT_SIZE - 1:0] A1;
  reg [BIT_SIZE - 1:0] Y;
  reg [BIT_SIZE - 1:0] q;

  // Outputs
  wire [BIT_SIZE - 1:0] B0;
  wire [BIT_SIZE - 1:0] B1;

  // Instantiate the Bu2Point module
  Bu2Point #(BIT_SIZE) uut (
    .clk(clk),
    .rstn(rstn),
    .A0(A0),
    .A1(A1),
    .Y(Y),
    .q(q),
    .B0(B0),
    .B1(B1)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Initial values
  initial begin
    rstn = 0;
    A0 = 0;
    A1 = 0;
    Y = 0;
    q = 0;

    // Apply reset
    #10 rstn = 1;

    // Apply inputs
#10 A0 = 64'h1388;  // 64'h1388 is hexadecimal for 5000
    #10 A1 = 64'h1B58;  // 64'h1B58 is hexadecimal for 7000
    #10 Y =  64'hBB8;   // 64'hBB8 is hexadecimal for 3000
    #10 q =  64'h2328;  // 64'h2328 is hexadecimal for 9000

    // Monitor outputs
    #100 $display("B0 = %0d, B1 = %0d", B0, B1);

    // Stop simulation
    #10 $stop;
  end

endmodule
