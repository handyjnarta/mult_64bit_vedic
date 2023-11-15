`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 18:59:21
// Design Name: 
// Module Name: adder_6_bit
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

/*
module adder_6_bit (
    input [5:0] A,
    input [5:0] B,
    input Cin,
    output Cout,
    output [5:0] Sum
);

    // Intermediate
    wire [4:0] Carry;

    full_Adder FA1(A[0], B[0], Cin, Carry[0], Sum[0]);
    full_Adder FA2(A[1], B[1], Carry[0], Carry[1], Sum[1]);
    full_Adder FA3(A[2], B[2], Carry[1], Carry[2], Sum[2]);
    full_Adder FA4(A[3], B[3], Carry[2], Carry[3], Sum[3]);
    full_Adder FA5(A[4], B[4], Carry[3], Carry[4], Sum[4]);
    full_Adder FA6(A[5], B[5], Carry[4], Cout, Sum[5]);

endmodule
*/

module adder_6_bit(a,b, sum);
input [5:0] a,b;
output [5:0] sum ; 
assign sum = a + b;
endmodule