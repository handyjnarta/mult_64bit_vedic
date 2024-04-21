`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 17:34:22
// Design Name: 
// Module Name: MOD_ADD
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


module MOD_ADD
    #(parameter MOD = 32'd4294967291,
                IN_BW = $clog2(MOD),               // Assumed, can be adjusted at instantiation. (HAVE TO ASSIGNING VALUE IF INPUT AND MODULUS ARE NOT EQUAL WIDTHS) 
                OUT_BW = $clog2(MOD)                // Always equal to MOD bitwidth
    )
    (
        input CLK,
        input [IN_BW-1:0] A,
        input [IN_BW-1:0] B,
        output reg [OUT_BW-1:0] Z 
    );
    
    // Wires
    wire [IN_BW-1:0] SUM;
    wire [IN_BW-1:0] SUB;
    wire SUM_CARRY;
    wire SUB_CARRY;
    
    // reg input
    reg [IN_BW-1:0] A_in;
    reg [IN_BW-1:0] B_in;
    
    // reg output
    wire [IN_BW-1:0] Z_out;
    
    // pipeline
    reg SEL_PIPE;
    reg [IN_BW-1:0] SUM_PIPE;
    reg [IN_BW-1:0] SUB_PIPE;
   
    always @(posedge CLK) begin
        A_in <= A;
        B_in <= B;
    end
    
    // Adder
    assign {SUM_CARRY,SUM} = A_in + B_in;
    
    // Subtractor
    assign {SUB_CARRY,SUB} = SUM - MOD;
    
    // Select 
    assign SEL = !(!SUM_CARRY & SUB_CARRY);
    
    // pipeline
    always @(posedge CLK) begin
        SUB_PIPE <= SUB;
        SUM_PIPE <= SUM;
        SEL_PIPE <= SEL;
    end
    
    // MUX
    assign Z_out = SEL_PIPE ? SUB_PIPE : SUM_PIPE;
    
    always @(posedge CLK) begin
        Z <= Z_out;
    end

endmodule
