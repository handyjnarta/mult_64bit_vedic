`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 20:11:21
// Design Name: 
// Module Name: rca_16bit_tb
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


module rca_16bit_tb();
    // input 
    reg [15:0] A;
    reg [15:0] B;
    reg Cin;
    // output
    wire Cout;
    wire [15:0] Sum;
    
    // instantiate UUT
    rca_16bit uut (.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Sum(Sum));
    
    // initial data
    initial
    begin
        A = 16'b0000000000000000;
        B = 16'b0000000000000000;
        Cin = 1'b0;
    end
    
    always #4 A = A + 1'b1;
    always #2 B = B + 1'b1;
    always #1 Cin = Cin + 1'b1;
    
    initial $monitor($time, "A = %b, B = %b, Cin = %b, Cout = %b, Sum = %b", A, B, Cin, Cout, Sum);
    initial #100 $finish;
    
endmodule
