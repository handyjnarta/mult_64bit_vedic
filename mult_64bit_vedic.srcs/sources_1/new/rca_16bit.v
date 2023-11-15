`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.11.2023 20:08:17
// Design Name: 
// Module Name: rca_16bit
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


module rca_16bit(
    input [15:0] A,
    input [15:0] B,
    input Cin,
    output Cout,
    output [15:0] Sum
    );
    
    // intermediate
    wire [14:0] Carry;
    
    genvar i;
    generate
        for (i = 0; i < 15; i = i + 1) begin
            full_Adder FA (
                .A(A[i]),
                .B(B[i]),
                .Cin(i == 0 ? Cin : Carry[i-1]),
                .Cout(Carry[i]),
                .Sum(Sum[i])
            );
        end
    endgenerate
    
    full_Adder FA2 (A[15], B[15], Carry[14], Cout, Sum[15]);
    
endmodule
