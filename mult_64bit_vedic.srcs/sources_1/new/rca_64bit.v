`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 19:01:25
// Design Name: 
// Module Name: rca_64bit
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


module rca_64bit(
    input [63:0] A,
    input [63:0] B,
    input Cin,
    output Cout,
    output [63:0] Sum
    );
    
    // intermediate
    wire [62:0] Carry;
    
    genvar i;
    generate
        for (i = 0; i < 63; i = i + 1) begin
            full_Adder FA (
                .A(A[i]),
                .B(B[i]),
                .Cin(i == 0 ? Cin : Carry[i-1]),
                .Cout(Carry[i]),
                .Sum(Sum[i])
            );
        end
    endgenerate
    
    full_Adder FA2 (A[63], B[63], Carry[62], Cout, Sum[63]);
    
endmodule
