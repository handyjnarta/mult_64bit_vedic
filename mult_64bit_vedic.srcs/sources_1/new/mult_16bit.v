`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.11.2023 15:28:52
// Design Name: 
// Module Name: mult_16bit
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

module mult_16bit (
    a, b, c
);
    input [15:0] a;
    input [15:0] b;
    output [31:0] c;

    wire [15:0] q0;
    wire [15:0] q1;
    wire [15:0] q2;
    wire [15:0] q3;
    wire [15:0] temp1; // padding 1
    wire [15:0] temp2; // padding 2
    wire [15:0] q4; // hasil adder 1
    wire [15:0] q5; // hasil adder 2
    wire [15:0] q6; // hasil adder 3
    wire c1; // carry in 1
    wire c2; // carry in 2
    wire c3; // or statement
    wire c4; // carry in 3
    
    // using 4 2x2 multipliers
    mult_8bit z1(a[7:0], b[7:0], q0[15:0]);
    mult_8bit z2(a[15:8], b[7:0], q1[15:0]);
    mult_8bit z3(a[7:0], b[15:8], q2[15:0]);
    mult_8bit z4(a[15:8], b[15:8], q3[15:0]);

    // stage 1 adders 
    assign temp1 = {8'b0, q0[15:8]};
    rca_16bit z5(q1[15:0], q2[15:0], 0, c1, q4);
    rca_16bit z6(temp1, q4[15:0], 0, c2, q5);
    assign c3 = c2 | c1;

    assign temp2 = {7'b0, c3, q5[15:8]};

    // stage 2 adder 
    rca_16bit z7(q3[15:0], temp2, 0, c4, q6);

    // fnal output assignment 
    assign c[7:0] = q0[7:0];
    assign c[15:8] = q5[7:0];
    assign c[31:16] = q6[15:0];

    // Display temp2/**/ for debugging
//    initial begin
//        $monitor("Time = %0t, temp2 = %b", $time, temp2);
//    end
endmodule
