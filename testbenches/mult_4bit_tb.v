`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 19:02:54
// Design Name: 
// Module Name: mult_4bit_tb
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

module mult_4bit_tb;
    reg [3:0] A;
    reg [3:0] B;
    
    // Output
    wire [7:0] Result;
    
    // Instantiate
    mult_4bit uut(A, B, Result);
    
    initial
    begin
        A = 4'b0000;
        B = 4'b0000;
    end
    
    always #2 A = A + 1'b1;
    always #1 B = B + 1'b1;
    
    initial $monitor($time, "A = %b, B = %b, Result[7:0] = %b", A, B, Result[7:0]);

    initial #30 $finish;
    
endmodule
