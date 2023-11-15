`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 19:12:26
// Design Name: 
// Module Name: mult_64bit_tb
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


module mult_64bit_tb();
    reg [63:0] A;
    reg [63:0] B;
    
    // Output
    wire [127:0] Result;
    
    // Instantiate
    mult_64bit uut (.a(A), .b(B), .c(Result));
    
    initial
    begin
        A = 64'b0000000000000000000000000000000000000000000000000000000000000000;
        B = 64'b0000000000000000000000000000000000000000000000000000000000000000;
    end
    
    always #2 A = A + 1'b1;
    always #1 B = B + 1'b1;
    
    initial $monitor($time, A, B, Result);
    initial #30 $finish;
endmodule
