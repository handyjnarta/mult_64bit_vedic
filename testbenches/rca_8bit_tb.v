`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 19:55:26
// Design Name: 
// Module Name: rca_8bit_tb
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
module rca_8bit_tb();
    // input 
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    // output
    wire Cout;
    wire [7:0] Sum;
    
    // instantiate UUT
    rca_8bit uut (.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Sum(Sum));
    
    // initial data
    initial
    begin
        A = 8'b00000000;
        B = 8'b00000000;
        Cin = 1'b0;
    end
    
    always #4 A = A + 1'b1;
    always #2 B = B + 1'b1;
    always #1 Cin = Cin + 1'b1;
    
    initial $monitor($time, "A = %b, B = %b, Cin = %b, Cout = %b, Sum = %b", A, B, Cin, Cout, Sum);
    initial #20 $finish;
    
endmodule
