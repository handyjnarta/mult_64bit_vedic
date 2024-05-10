//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2024 20:31:29
// Design Name: 
// Module Name: vedic_64_dsp
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
`timescale 1ns / 1ps

module vedic_64_dsp(
    input clk,
    input [63:0] a,
    input [63:0] b,
    output reg [127:0] result
    );
    
    wire [63:0] p_q0;
    wire [63:0] p_q1;
    wire [63:0] p_q2;
    wire [63:0] p_q3;
    wire [63:0] temp1; // padding 1
    wire [63:0] temp2; // padding 2
    wire [63:0] q4; // hasil adder 1
    wire [63:0] q5; // hasil adder 2
    wire [63:0] q6; // hasil adder 3
    wire c1; // carry in 1
    wire c2; // carry in 2
    wire c3; // or statement
    wire c4; // carry in 3

    reg [127:0] out_result;
    
    // input registers
    reg [63:0] in_a;
    reg [63:0] in_b;

    // pipeline register
    reg [63:0] q0;
    reg [63:0] q1;
    reg [63:0] q2;
    reg [63:0] q3;
    
    always @(posedge clk) begin
        in_a <= a;
        in_b <= b;
    end
    
    p_q0 = in_a[31:0] * in_b[31:0];
    p_q1 = in_a[63:32] * in_b[31:0];
    p_q2 = in_a[31:0] * in_b[63:32];
    p_q3 = in_a[63:32] * in_b[63:32];

    // single stage pipeline after multiplying stage
    always @(posedge clk) begin
        q0 <= p_q0;
        q1 <= p_q1;
        q2 <= p_q2;
        q3 <= p_q3;
    end
    
    temp1 = {32'b0, q0[63:32]};
    {c1, q4} = q1[63:0] + q2[63:0];
    {c2, q5} = temp1 + q4[63:0];
    c3 = c2 | c1;
    temp2 = {31'b0, c3, q5[63:32]};
    {c4, q6} = q3[63:0] + temp2;
    
    // merge result
    always @(posedge clk) begin
        out_result = {q6[63:0], q5[31:0], q0[31:0]};
        result <= out_result;
    end
    
endmodule
