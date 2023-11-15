`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2023 22:05:18
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb();
    // input 
    reg A;
    reg B;
    
    // output
    wire Cout;
    wire Sum;
    
    // instantiate UUT
    half_adder uut(A, B, Cout,Sum);
    
    // initial data
    initial
    begin
        A = 0;
        B = 0;
    end
    
    always #4 A = A + 1'b1;
    always #2 B = B + 1'b1;
    
    initial $monitor($time, A, B, Cout, Sum);
    initial #20 $finish;
    
endmodule
