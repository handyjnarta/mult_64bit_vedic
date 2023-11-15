`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2023 15:20:00
// Design Name: 
// Module Name: mult_8bit
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
module mult_8bit (
    a, b, c
);
    input [7:0] a;
    input [7:0] b;
    output [15:0] c;

    wire [7:0] q0;
    wire [7:0] q1;
    wire [7:0] q2;
    wire [7:0] q3;
    wire [7:0] temp1; // padding 1
    wire [7:0] temp2; // padding 2
    wire [7:0] q4; // hasil adder 1
    wire [7:0] q5; // hasil adder 2
    wire [7:0] q6; // hasil adder 3
    wire c1; // carry in 1
    wire c2; // carry in 2
    wire c3; // or statement
    wire c4; // carry in 3
    wire cin;

    // using 4 2x2 multipliers
    mult_4bit z1(a[3:0], b[3:0], q0[7:0]);
    mult_4bit z2(a[7:4], b[3:0], q1[7:0]);
    mult_4bit z3(a[3:0], b[7:4], q2[7:0]);
    mult_4bit z4(a[7:4], b[7:4], q3[7:0]);

    // stage 1 adders 
    assign temp1 = {4'b0, q0[7:4]};
    rca_8bit z5(q1[7:0], q2[7:0], 0, c1, q4);
    rca_8bit z6(temp1, q4[7:0], 0, c2, q5);
    assign c3 = c2 | c1;

    assign temp2 = {3'b0, c3, q5[7:4]};

    // stage 2 adder 
    rca_8bit z7(q3[7:0], temp2, 0, c4, q6);

    // fnal output assignment 
    assign c[3:0] = q0[3:0];
    assign c[7:4] = q5[3:0];
    assign c[15:8] = q6[7:0];

    // Display temp2/**/ for debugging
//    initial begin
//        $monitor("Time = %0t, temp2 = %b", $time, temp2);
//    end
endmodule
