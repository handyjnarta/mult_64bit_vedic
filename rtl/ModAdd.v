module ModAdd
    #(parameter BIT_SIZE = 60)
    (
        input clk,
        input rstn,
        input [BIT_SIZE - 1:0] A,
        input [BIT_SIZE - 1:0] B,
        input [BIT_SIZE - 1:0] q,
        output reg [BIT_SIZE - 1:0] M
    );

    wire [BIT_SIZE+1:0] add;

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

    // datapath for addition
    assign add = {1'b0, in_A} + {1'b0, in_B};

    // output
    always @(posedge clk or negedge rstn)
    begin
        if (~rstn)
        begin
            M <= 0;
        end
        else
        begin
            // Check if the sum is greater than or equal to q
            if (add[BIT_SIZE+1]) 
                M <= add[BIT_SIZE-1:0];
            else
                M <= add[BIT_SIZE-1:0] - in_q;
        end
    end

endmodule
