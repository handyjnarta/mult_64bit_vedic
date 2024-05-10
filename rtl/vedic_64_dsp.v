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
    
    // registers for pipeline stages
    reg [63:0] q0;
    reg [63:0] q1;
    reg [63:0] q2;
    reg [63:0] q3;
    reg [63:0] temp1; // padding 1
    reg [63:0] temp2; // padding 2
    reg [63:0] q4; // hasil adder 1
    reg [63:0] q5; // hasil adder 2
    reg [63:0] q6; // hasil adder 3
    reg c1; // carry in 1
    reg c2; // carry in 2
    reg c3; // or statement
    reg c4; // carry in 3
    reg [127:0] out_result;
    
    // input registers
    reg [63:0] in_a;
    reg [63:0] in_b;
    
    always @(posedge clk) begin
        in_a <= a;
        in_b <= b;
    end
    
    // pipeline stage 1: multiplier
    always @* begin
        q0 = in_a[31:0] * in_b[31:0];
        q1 = in_a[63:32] * in_b[31:0];
        q2 = in_a[31:0] * in_b[63:32];
        q3 = in_a[63:32] * in_b[63:32];
    end
    
    // pipeline stage 2: stage 1 adder
    always @* begin
        temp1 = {32'b0, q0[63:32]};
        {c1, q4} = q1[63:0] + q2[63:0];
        {c2, q5} = temp1 + q4[63:0];
        c3 = c2 | c1;
        temp2 = {31'b0, c3, q5[63:32]};
    end
    
    // pipeline stage 3: stage 2 adder
    always @* begin
        {c4, q6} = q3[63:0] + temp2;
    end
    
    // merge result
    always @(posedge clk) begin
        out_result = {q6[63:0], q5[31:0], q0[31:0]};
        result <= out_result;
    end
    
endmodule
