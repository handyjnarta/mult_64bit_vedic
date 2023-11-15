/*module adder_4_bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output Cout,
    output [3:0] Sum
    );
    
    // intermediate
    wire [2:0] Carry;
    
    full_Adder FA1(A[0], B[0], Cin, Carry[0], Sum[0]);
    full_Adder FA2(A[1], B[1], Carry[0], Carry[1], Sum[1]);
    full_Adder FA3(A[2], B[2], Carry[1], Carry[2], Sum[2]);
    full_Adder FA4(A[3], B[3], Carry[2], Cout, Sum[3]);
    
endmodule*/

module adder_4_bit(a,b, sum);
input [3:0] a,b;
output [3:0] sum ; 
assign sum = a + b;
endmodule