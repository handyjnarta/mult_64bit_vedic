`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 19:23:26
// Design Name: 
// Module Name: full_adder
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


module full_Adder(
    input A,
    input B,
    input Cin,
    output Cout,
    output Sum
    );
    
    // dataflow architectural design
    assign Cout = (A & B) | (A & Cin) | (B & Cin);
    assign Sum = A ^ B ^ Cin;
    
endmodule