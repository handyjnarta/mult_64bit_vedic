`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/03 10:59:08
// Design Name: 
// Module Name: karatsuba256
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

(* use_dsp = "yes" *)
module karatsuba256(
        input wire clk,
        input wire [255:0] x,
        input wire [255:0] y,
        output reg [511:0] product
    );
    
    parameter HALF_BITS = 128; // 256 bit input means 128 bits for half
    reg [255:0] z0, z2;
    reg [383:0] z1;
    reg [255:0] low1, high1, low2, high2;
    
    always @(posedge clk) begin
        // Split the numbers into halves
        low1 <= x & ((1 << HALF_BITS) - 1);
        low2 <= y & ((1 << HALF_BITS) - 1);
        high1 <= x >> HALF_BITS;
        high2 <= y >> HALF_BITS;
    
        // Recursive steps
        z0 <= low1 * low2;
        z1 <= (low1 + high1) * (low2 + high2) - z0 - z2;
        z2 <= high1 * high2;
    
        // Combine results using the Karatsuba formula
        product <= (z2 << (2 * HALF_BITS)) + (z1 << HALF_BITS) + z0;
    end
endmodule
