`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2024 20:20:57
// Design Name: 
// Module Name: karatsuba64_tb
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


module karatsuba64_tb;

  // Declare signals for UUT inputs and outputs
  reg CLK;
  reg [63:0] x, y;
  wire [127:0] product;

  // Instantiate the UUT
  karatsuba64 uut (
    .clk(CLK),
    .x(x),
    .y(y),
    .product(product)
  );

  // Clock generation
  always begin
    #5 CLK = ~CLK; // Generate a clock signal with 10 ns period
  end

  // Initialize inputs
  initial begin
    CLK = 0;
    x = 64'd123456789;
    y = 64'd20;
  end

  // Monitor the output
  always @(posedge CLK) begin
    $display("Result: %h", product);
  end

  // Stimulus generation
  initial begin
    // Wait for a few clock cycles
    #100;

    // Add more test cases here if needed

    // Finish simulation
    $finish;
  end

endmodule
