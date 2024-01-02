
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2023 17:37:35
// Design Name: 
// Module Name: full_adder4bit_tb
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


`timescale 1ns/1ps

module FullAdder_tb;

  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  wire [4:0] Sum;
  wire Cout;

  // Instantiate the FullAdder module
  FullAdder #(4) uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Stimulus
  initial begin
    A = 4'b0000;
    B = 4'b0000;
    Cin = 0;

    #10 A = 4'b0101;
    B = 4'b1010;
    Cin = 0;

    #10 A = 4'b1111;
    B = 4'b0001;
    Cin = 1;

    #10 $finish;
  end

  // Display results
  always @(posedge Cout or posedge Sum[4]) begin
    $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
  end

endmodule
