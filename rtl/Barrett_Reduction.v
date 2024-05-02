`timescale 1ns/1ps

module Barrett_Reduction(
    input clk,      // Asynchronous clock
    input rst,      // Synchronous reset
    input [127:0] z,
    input [63:0] q,
    input [30:0] mu,
    input [7:0] k,
    output reg [63:0] t
);

    reg [127:0] m1;
    reg [127:0] m2;
    reg [127:0] m3;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            m1 <= 128'h0;
            m2 <= 128'h0;
            m3 <= 128'h0;
            t <= 64'h0;
        end else begin
            m1 <= z >> k;
            m2 <= m1 * mu;
            m3 <= m2 >> k;
            t <= z - m3 * q;
        end
    end
    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            // Reset t when rst is active
            t <= 64'h0;
        end else begin
            if (t >= q) begin
                // r = t - q
                t <= t - q;
            end
        end
    end

endmodule
