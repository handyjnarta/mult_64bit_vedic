`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 14:32:55
// Design Name: 
// Module Name: mult_4bit
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

module mult_4bit (
    a, b, c
);
    input [3:0] a;
    input [3:0] b;
    output [7:0] c;

    wire [3:0] q0;
    wire [3:0] q1;
    wire [3:0] q2;
    wire [3:0] q3;
    wire [3:0] temp1; // padding 1
    wire [3:0] temp2; // padding 2
    wire [3:0] q4; // hasil adder 1
    wire [3:0] q5; // hasil adder 2
    wire [3:0] q6; // hasil adder 3
    wire c1; // carry in 1
    wire c2; // carry in 2
    //wire c3; // or statement
    wire c4; // carry in 3
    wire cin;

    // using 4 2x2 multipliers
    mult_2bit z1(a[1:0], b[1:0], q0[3:0]);
    mult_2bit z2(a[3:2], b[1:0], q1[3:0]);
    mult_2bit z3(a[1:0], b[3:2], q2[3:0]);
    mult_2bit z4(a[3:2], b[3:2], q3[3:0]);

    // stage 1 adders 
    assign temp1 = {2'b0, q0[3:2]};
    rca_4bit z5(q1[3:0], q2[3:0], 0, c1, q4);
    rca_4bit z6(temp1, q4[3:0], 0, c2, q5);
    //assign c3 = c2 | c1;

    assign temp2 = {2'b0, q5[3:2]};

    // stage 2 adder 
    rca_4bit z7(q3[3:0], temp2, 0, c4, q6);

    // fnal output assignment 
    assign c[1:0] = q0[1:0];
    assign c[3:2] = q5[1:0];
    assign c[7:4] = q6[3:0];

    // Display temp2 for debugging
//    initial begin
//        $monitor("Time = %0t, temp2 = %b", $time, temp2);
//    end
endmodule
