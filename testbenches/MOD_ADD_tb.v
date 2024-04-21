`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 17:45:15
// Design Name: 
// Module Name: MOD_ADD_tb
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


module MOD_ADD_tb();

    parameter           MOD        = 32'd4294967291;
    parameter integer CH_BW        = $clog2(MOD);  
    
    // Test parameters
    parameter N_TESTS  = 10;
  
  
    //one per channel
    reg CLK = 0;
    reg  [CH_BW-1:0] A;
    reg  [CH_BW-1:0] B;
    reg  [CH_BW-1:0] M = MOD;
    wire [CH_BW-1:0] Z;
    
    reg correct = 0;
    reg [$clog2(N_TESTS)-1:0] TOTAL_CORRECT = 0;
    reg [$clog2(N_TESTS)-1:0] TEST_NO       = -1;
    
    // instantiate RNS module    
    MOD_ADD #(MOD) uut (
      .CLK(CLK),
      .A(A),
      .B(B),
      .Z(Z)
     );
     
     wire [CH_BW:0] SUM = A + B;
     reg [CH_BW:0] expected;
     reg [CH_BW:0] expected_prev;
     reg [CH_BW:0] expected_prev_prev;
     
    // start clock 
    initial begin
      for (integer i = 0; i < N_TESTS; i = i+1) begin
      
          // Get random inputs
          A <= $random % MOD;  //random
          B <= $random % MOD;  //random
          TEST_NO <= TEST_NO + 1;
          
          // Get correct answers
          if (Z == expected) begin
              correct <= 1;
              TOTAL_CORRECT <= TOTAL_CORRECT + 1;
          end
          else begin
              correct <= 0;     
          end
       
          // Edge 1
          #1
          CLK <= ~CLK;
          
          
          
          expected = expected_prev;
          
          expected_prev = expected_prev_prev;
         
          ////////////////////////////////////////      
          // Edge 2 
          #1
          CLK <= ~CLK;
          
          expected_prev_prev = SUM % M;
          
      end
    end
    
    initial #20 $finish;
    
endmodule
