`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 18:58:40
// Design Name: 
// Module Name: rca_32bit_tb
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


module rca_32bit_tb();
    // input 
    reg [31:0] A;
    reg [31:0] B;
    reg Cin;
    // output
    wire Cout;
    wire [31:0] Sum;
    
    // instantiate UUT
    rca_32bit uut (.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Sum(Sum));
    
    // initial data
    initial
    begin
        A = 32'b00000000000000000000000000000000;
        B = 32'b00000000000000000000000000000000;
        Cin = 1'b0;
    end
    
    always #4 A = A + 1'b1;
    always #2 B = B + 1'b1;
    always #1 Cin = Cin + 1'b1;
    
    initial $monitor($time, "A = %b, B = %b, Cin = %b, Cout = %b, Sum = %b", A, B, Cin, Cout, Sum);
    initial #100 $finish;
    
endmodule