`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 19:41:41
// Design Name: 
// Module Name: rca_8bit
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

module rca_8bit(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    output Cout,
    output [7:0] Sum
    );
    
    // intermediate
    wire [6:0] Carry;
    
    full_Adder FA1(A[0], B[0], Cin, Carry[0], Sum[0]);
    full_Adder FA2(A[1], B[1], Carry[0], Carry[1], Sum[1]);
    full_Adder FA3(A[2], B[2], Carry[1], Carry[2], Sum[2]);
    full_Adder FA4(A[3], B[3], Carry[2], Carry[3], Sum[3]);
    full_Adder FA5(A[4], B[4], Carry[3], Carry[4], Sum[4]);
    full_Adder FA6(A[5], B[5], Carry[4], Carry[5], Sum[5]);
    full_Adder FA7(A[6], B[6], Carry[5], Carry[6], Sum[6]);
    full_Adder FA8(A[7], B[7], Carry[6], Cout, Sum[7]);
    
endmodule
