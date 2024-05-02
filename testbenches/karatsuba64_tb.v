`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/01 21:26:55
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


module karatsuba64_tb();
    // Declare signals for UUT inputs and outputs
    reg CLK;
    reg [63:0] x, y;
    wire [127:0] product;
  
    // Test parameters
    parameter N_TESTS  = 10;
    reg correct = 0;
    reg [$clog2(N_TESTS)-1:0] TOTAL_CORRECT = 0;
    reg [$clog2(N_TESTS)-1:0] TEST_NO       = -1;

    // Instantiate the UUT
    karatsuba64 uut (
        .clk(CLK),
        .x(x),
        .y(y),
        .product(product)
    );
    
    reg [127:0] expected;
    reg [127:0] prev_expedted;

  // Initialize inputs
  initial begin
    CLK = 1;
    for (integer i = 0; i < N_TESTS; i = i+1) begin
      
          TEST_NO <= TEST_NO + 1;
       
          // Edge 1
          #1
          CLK <= ~CLK;
         
          ////////////////////////////////////////      
          // Edge 2 
          #1
          CLK <= ~CLK;
          
          // Get correct answers
          if (product == prev_expedted) begin
              correct <= 1;
              TOTAL_CORRECT <= TOTAL_CORRECT + 1;
          end
          else begin
              correct <= 0;     
          end
          
          // Get random inputs
          x <= $random % 64'd17936324404867310943;  //random
          y <= $random % 64'd17936324404867310943;  //random
          prev_expedted = expected;
          expected = x * y;

      end
      
    // Finish simulation after looping
    $finish;
    
  end

  // Monitor the output
  always @(posedge CLK) begin
    $display("Result: %h", product);
  end

endmodule
