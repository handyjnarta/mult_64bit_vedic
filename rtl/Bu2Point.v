module Bu2Point
    #(parameter BIT_SIZE = 60)
    (
        input clk,
        input rstn,
        input [BIT_SIZE - 1:0] A0,
        input [BIT_SIZE - 1:0] A1,
        input [BIT_SIZE - 1:0] Y,
        input [BIT_SIZE - 1:0] q,
        output reg [BIT_SIZE - 1:0] B0,
        output reg [BIT_SIZE - 1:0] B1,
    );

    // For operation result
    wire [BIT_SIZE + 1:0] add;
    wire [BIT_SIZE + 1:0] sub;
    wire [BIT_SIZE + 1:0] M;
    
    // For input and output
    reg  [BIT_SIZE - 1:0] in_A0;
    reg  [BIT_SIZE - 1:0] in_A1;
    reg  [BIT_SIZE - 1:0] in_Y;
    reg  [BIT_SIZE - 1:0] in_q;
    wire [BIT_SIZE - 1:0] out_B0;
    wire [BIT_SIZE - 1:0] out_B1;

    // For barrett
    // reg  [BIT_SIZE - 1:0] k = 7'b111100;
    wire [127:0] r_mult = {8'b0, A1 * Y};
    wire [63:0] q_barrett = {4'b0, q};
    localparam R = 1 << 60;
    reg  [7:0] k = 7'b111100;
    reg  [30:0] mu;
    wire  [63:0] t; // barrett result

    // nilai yang sensitif terhadap input q
    always @(q) begin
        mu = R*R/q;
    end

    // input
    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
        begin
            in_A0 <= 0;
            in_A1 <= 0;
            in_Y <= 0;
            in_q <= 0;
        end
        else
        begin
            in_A0 <= A0;
            in_A1 <= A1;
            in_Y <= Y;
            in_q <= q;
        end
    end
    
    // datapath for barrett reduction
    Barrett_Reduction br1(r_mult[127:0], q_barrett[63:0],  mu[30:0], k[7:0], t[63:0]);

    assign M = t[BIT_SIZE - 1 : 0]; // biar bisa masuk ke ModAdd dan ModSub

    // datapath for addition
    ModAdd ModAdd1 (clk,rstn,in_A0[BIT_SIZE-1:0],M[BIT_SIZE-1:0],in_q[BIT_SIZE-1:0],B0[BIT_SIZE-1:0]);

    // datapath for substraction
    ModSub ModSub (clk,rstn,in_A0[BIT_SIZE-1:0],M[BIT_SIZE-1:0],in_q[BIT_SIZE-1:0],B1[BIT_SIZE-1:0]);
   
endmodule
