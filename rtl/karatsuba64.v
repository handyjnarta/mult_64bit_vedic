`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/01 21:24:32
// Design Name: 
// Module Name: karatsuba64
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


module karatsuba64(
        input wire clk,
        input wire [63:0] x,
        input wire [63:0] y,
        output reg [127:0] product
    );

    parameter HALF_BITS = 32; // 64 bit input means 7 bits for half
    reg [127:0] z0, z1, z2;
    reg [63:0] low1, high1, low2, high2;

    // pipeline registers
    reg [127:0] reg_z0, reg_z1, reg_z2;
    reg [63:0] reg_low1, reg_high1, reg_low2, reg_high2;
    
    always @(posedge clk) begin
        // Split the numbers into halves
        low1 <= x & ((1 << HALF_BITS) - 1);
        low2 <= y & ((1 << HALF_BITS) - 1);
        high1 <= x >> HALF_BITS;
        high2 <= y >> HALF_BITS;
        
        // Pipeline registers
        reg_low1 <= low1;
        reg_high1 <= high1;
        reg_low2 <= low2;
        reg_high2 <= high2;
        reg_z0 <= z0;
        reg_z1 <= z1;
        reg_z2 <= z2;
    end

    // Intermediate computations
    always @* begin
        // Recursive steps
        z0 = low1 * low2;
        z1 = (low1 + high1) * (low2 + high2);
        z2 = high1 * high2;
    end

    // Combine results using the Karatsuba formula
    always @(posedge clk) begin
        product <= (reg_z2 << (2 * HALF_BITS)) + ((reg_z1 - reg_z2 - reg_z0) << HALF_BITS) + reg_z0;
    end
endmodule
