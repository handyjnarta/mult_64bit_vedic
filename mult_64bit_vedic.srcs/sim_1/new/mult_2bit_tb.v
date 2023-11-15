`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 13:30:39
// Design Name: 
// Module Name: mult_2bit_tb
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


module mult_2bit_tb();
    reg [1:0] A;
    reg [1:0] B;
    
    // Output
    wire [3:0] Result;
    
    // Instantiate
    mult_2bit uut(A, B, Result);
    
    initial
    begin
        A = 4'b00;
        B = 4'b00;
    end
    
    always #2 A = A + 1'b1;
    always #1 B = B + 1'b1;
    
    initial $monitor($time, A, B, Result);
    initial #30 $finish;
    
endmodule
