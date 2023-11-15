`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 18:58:20
// Design Name: 
// Module Name: rca_32bit
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



module rca_32bit(
    input [31:0] A,
    input [31:0] B,
    input Cin,
    output Cout,
    output [31:0] Sum
    );
    
    // intermediate
    wire [30:0] Carry;
    
    genvar i;
    generate
        for (i = 0; i < 31; i = i + 1) begin
            full_Adder FA (
                .A(A[i]),
                .B(B[i]),
                .Cin(i == 0 ? Cin : Carry[i-1]),
                .Cout(Carry[i]),
                .Sum(Sum[i])
            );
        end
    endgenerate
    
    full_Adder FA2 (A[31], B[31], Carry[30], Cout, Sum[31]);
    
endmodule
