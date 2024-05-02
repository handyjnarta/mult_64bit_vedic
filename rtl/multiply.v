`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/01 20:33:06
// Design Name: 
// Module Name: multiply
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


module multiply(
        input clk,
        input [63:0] in1,
        input [63:0] in2,
        output reg [127:0] out
    );
    
    always @(posedge clk) begin
        out = in1*in2;
    end
    
endmodule
