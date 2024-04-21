`timescale 1ns/1ps

module karastuba
    #(parameter k = 48)
    (
        input [k - 1:0] x,
        input [k - 1:0] y,
        output [2*k - 1:0] z
    );
    
    localparam k_part = k / 2;
        
    wire [k_part - 1:0] x_hi, x_lo;
    wire [k_part - 1:0] y_hi, y_lo;
    
    wire [k_part*2 - 1:0] p;
    wire [k_part*2 - 1:0] q;
    wire [k_part:0]       r;
    wire [k_part:0]       s;
    
    wire [k_part*2:0] u;
    
    wire [k + 1:0] t;
    wire r_hi, s_hi;
    wire [k_part - 1:0] r_lo, s_lo;
    
    wire [k - 1:0] t_s;
    
    // Split the numbers into halves
    assign {x_hi, x_lo} = x;
    assign {y_hi, y_lo} = y;
    
    assign p = x_hi * y_hi;
    assign q = x_lo * y_lo;
    assign r = x_hi + x_lo;
    assign s = y_hi + y_lo;    
    
    assign  u = p + q;      
    
    assign {r_hi, r_lo} = r;
    assign {s_hi, s_lo} = s;     

    assign t_s = r_lo * s_lo;
    assign t = ((r_hi & s_hi) << k) + ((r_hi * s_lo + s_hi * r_lo) << k_part) + t_s;
    
    assign z = (p << k) + ((t - u) << k_part) + q;

endmodule
