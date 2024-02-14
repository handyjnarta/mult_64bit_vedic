`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2024 22:38:47
// Design Name: 
// Module Name: ModSub
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


module ModSub
    #(parameter BIT_SIZE = 60)
    (
        input clk,
        input rstn,
        input      [BIT_SIZE - 1:0] A,
        input      [BIT_SIZE - 1:0] B,
        input      [BIT_SIZE - 1:0] q,
        output reg [BIT_SIZE - 1:0] M
    );
    
    wire [BIT_SIZE:0] add;
    wire [BIT_SIZE:0] sub;
        
    reg  [BIT_SIZE - 1:0] in_A;
    reg  [BIT_SIZE - 1:0] in_B;
    reg  [BIT_SIZE - 1:0] in_q;
    wire [BIT_SIZE - 1:0] out_M;
    
    // input
    always @(posedge clk or negedge rstn)
    begin
        if (~rstn) 
        begin
            in_A <= 0;
            in_B <= 0;
            in_q <= 0;
        end
        else
        begin
            in_A <= A;
            in_B <= B;
            in_q <= q;
        end
    end
    
    // datapath
    assign sub = in_A - in_B;
    assign add = sub[BIT_SIZE - 1:0] + in_q;
    
    assign out_M = (sub[BIT_SIZE]) ? add[BIT_SIZE - 1:0] : sub[BIT_SIZE - 1:0];
    
    
    // output
    always @(posedge clk or negedge rstn)
    begin
        if (~rstn) 
        begin
            M <= 0;
        end
        else
        begin
            M <= out_M;
        end
    end
    
endmodule
