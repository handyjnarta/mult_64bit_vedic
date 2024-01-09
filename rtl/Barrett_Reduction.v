`timescale 1ns/1ps

module Barrett_Reduction(
    input [127:0] z,
    input [63:0] q,
    input [30:0] mu,
    input [7:0] k,
    output reg [63:0] t
);


    wire [127:0] m1 = z >> k;
    wire [127:0] m2 = m1 * mu;
    wire [127:0] m3 = m2 >> k;

    always @* begin
        t = z - m3 * q;
    end
    
    always @* begin
        if (t >= q) begin
            // r = t - q
            t <= t - q;
        end

    end

endmodule
