`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2023 15:33:39
// Design Name: 
// Module Name: mult_16bit_tb
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



module mult_16bit_tb();
    reg [15:0] A;
    reg [15:0] B;
    
    // Output
    wire [31:0] Result;
    
    // Instantiate
    mult_16bit uut (.a(A), .b(B), .c(Result));
    
    initial
    begin
        A = 16'b0000000000000000;
        B = 16'b0000000000000000;
    end
    
    always #2 A = A + 1'b1;
    always #1 B = B + 1'b1;
    
    initial $monitor($time, A, B, Result);
    initial #30 $finish;
endmodule
