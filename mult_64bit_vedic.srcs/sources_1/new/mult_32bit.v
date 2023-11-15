`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2023 17:06:14
// Design Name: 
// Module Name: mult_32bit
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


module mult_32bit (
    a, b, c
);
    input [32:0] a;
    input [32:0] b;
    output [63:0] c;

    wire [31:0] q0;
    wire [31:0] q1;
    wire [31:0] q2;
    wire [31:0] q3;
    wire [31:0] temp1; // padding 1
    wire [31:0] temp2; // padding 2
    wire [31:0] q4; // hasil adder 1
    wire [31:0] q5; // hasil adder 2
    wire [31:0] q6; // hasil adder 3
    wire c1; // carry in 1
    wire c2; // carry in 2
    wire c3; // or statement
    wire c4; // carry in 3
    
    // using 4 2x2 multipliers
    mult_16bit z1(a[15:0], b[15:0], q0[31:0]);
    mult_16bit z2(a[31:16], b[15:0], q1[31:0]);
    mult_16bit z3(a[15:0], b[31:16], q2[31:0]);
    mult_16bit z4(a[31:16], b[31:16], q3[31:0]);

    // stage 1 adders 
    assign temp1 = {16'b0, q0[31:16]};
    rca_32bit z5(q1[31:0], q2[31:0], 0, c1, q4);
    rca_32bit z6(temp1, q4[31:0], 0, c2, q5);
    assign c3 = c2 | c1;

    assign temp2 = {15'b0, c3, q5[31:16]};

    // stage 2 adder 
    rca_32bit z7(q3[31:0], temp2, 0, c4, q6);

    // fnal output assignment 
    assign c[15:0] = q0[15:0];
    assign c[31:16] = q5[15:0];
    assign c[63:32] = q6[31:0];

    // Display temp2/**/ for debugging
//    initial begin
//        $monitor("Time = %0t, temp2 = %b", $time, temp2);
//    end
endmodule