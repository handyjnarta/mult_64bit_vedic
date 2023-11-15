`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2023 15:21:29
// Design Name: 
// Module Name: mult_8bit_tb
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


module mult_8bit_tb(   );
    reg [7:0] A;
    reg [7:0] B;
    
    // Output
    wire [15:0] Result;
    
    // Instantiate
    mult_8bit uut(A, B, Result);
    
    initial
    begin
        A = 8'b00000000;
        B = 8'b00000000;
    end
    
    always #2 A = A + 1'b1;
    always #1 B = B + 1'b1;
    
    initial $monitor($time, A, B, Result);
    initial #30 $finish;
    
 
endmodule
