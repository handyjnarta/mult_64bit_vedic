module multiplier_64bit (
    input [63:0] operand_a,
    input [63:0] operand_b,
    output reg [127:0] result
);


    result <= operand_a * operand_b;

endmodule
