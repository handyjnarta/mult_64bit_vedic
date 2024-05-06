`timescale 1ns/1ps

module Barrett_Reduction(
    input clk,      // Asynchronous clock
    input [127:0] z,
    input [63:0] q,
    input [30:0] mu,
    input [7:0] k,
    output reg [63:0] t
);  
    // input
    reg [127:0] z_in;
    reg [63:0] q_in;
    reg [30:0] mu_in;
    reg [7:0] k_in;  
    
    // pipeline
    reg [127:0] m2_in;
    reg [127:0] z_in_2;
    reg [63:0] q_in_2;
    reg [7:0] k_in_2;

    // input
    always @(posedge clk) begin
         begin
           z_in <= z;
           q_in <= q;
           mu_in <= mu;
           k_in <= k;
        end
    end
    
     wire [127:0] m1 = z_in >> k_in;
     wire [127:0] m2 = m1 * mu_in;
     
     // pipeline
     always @(posedge clk) begin
        m2_in <= m2;
        z_in_2 <= z_in;
        q_in_2 <= q_in;
        k_in_2 <= k_in;
     end
     
     wire [127:0] m3 = m2_in >> k_in_2;
     wire [63:0] t_out = z_in_2 - m3 * q_in_2;    
    
    // output
    always @(posedge clk) 
    begin
            if (t_out >= q_in) 
            begin
            // r = t - q
            t <= t_out - q_in;
            end
            else begin
            t <= t_out;
            end
    end
endmodule