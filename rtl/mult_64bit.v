`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.11.2023 19:19:07
// Design Name: 
// Module Name: mult_64bit
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


module mult_64bit (
    a, b, c
);
    input [63:0] a;
    input [63:0] b;
    output [127:0] c;

    wire [63:0] q0;
    wire [63:0] q1;
    wire [63:0] q2;
    wire [63:0] q3;
    wire [63:0] temp1; // padding 1
    wire [63:0] temp2; // padding 2
    wire [63:0] q4; // hasil adder 1
    wire [63:0] q5; // hasil adder 2
    wire [63:0] q6; // hasil adder 3
    wire c1; // carry in 1
    wire c2; // carry in 2
    wire c3; // or statement
    wire c4; // carry in 3
    
    // using 4 2x2 multipliers
    mult_32bit z1(a[31:0], b[31:0], q0[63:0]);
    mult_32bit z2(a[63:32], b[31:0], q1[63:0]);
    mult_32bit z3(a[31:0], b[63:32], q2[63:0]);
    mult_32bit z4(a[63:32], b[63:32], q3[63:0]);

    // stage 1 adders 
    assign temp1 = {32'b0, q0[63:32]};
    rca_64bit z5(q1[63:0], q2[63:0], 0, c1, q4);
    rca_64bit z6(temp1, q4[63:0], 0, c2, q5);
    assign c3 = c2 | c1;

    assign temp2 = {31'b0, c3, q5[63:32]};

    // stage 2 adder 
    rca_64bit z7(q3[63:0], temp2, 0, c4, q6);

    // fnal output assignment 
    assign c[31:0] = q0[31:0];
    assign c[63:32] = q5[31:0];
    assign c[127:64] = q6[63:0];

    // Display temp2/**/ for debugging
//    initial begin
//        $monitor("Time = %0t, temp2 = %b", $time, temp2);
//    end
endmodule
