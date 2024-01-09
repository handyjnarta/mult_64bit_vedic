`timescale 1ns / 1ps
`include "../rtl/full_adder.v"
`include "../rtl/full_adder4bit.v"
`include "../rtl/ha.v"
`include "../rtl/half_adder.v"
`include "../rtl/mult_2bit.v"
`include "../rtl/mult_4bit.v"
`include "../rtl/mult_8bit.v"
`include "../rtl/mult_16bit.v"
`include "../rtl/mult_32bit.v"
`include "../rtl/mult_64bit.v"
`include "../rtl/rca_4bit.v"
`include "../rtl/rca_8bit.v"
`include "../rtl/rca_16bit.v"
`include "../rtl/rca_32bit.v"
`include "../rtl/rca_64bit.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 19:12:26
// Design Name: 
// Module Name: mult_64bit_tb
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


module mult_64bit_tb();
    reg [63:0] A;
    reg [63:0] B;
    
    // Output
    wire [127:0] Result;
    
    // Instantiate
    mult_64bit uut (.a(A), .b(B), .c(Result));
    
    initial
    begin
        $dumpfile("mult_64bit_tb.vcd");
        $dumpvars(0,mult_64bit_tb);
        A = 16743343434;
        B = 2;
    end
 
    
    initial $monitor($time, A, B, Result);
    initial #30 $finish;
endmodule
