
`timescale 1ns / 1ps

module fa(cin,x,y,s,cout
    );
parameter n=4;
input cin; //carry input
input [n-1:0]x,y;//numbers to be added 
output [n-1:0]s;//sum
output cout;//carry out
wire [n:0]c;

genvar k; // generate 32 full adders with k as variable
assign c[0]=cin;
assign cout=c[n];

generate // generate 32 full adders 
for(k=0;k<n;k=k+1)
begin:fa
wire z1,z2,z3;
xor(s[k],x[k],y[k],c[k]);
and(z1,x[k],y[k]);
and(z2,x[k],c[k]);
and(z3,c[k],y[k]);
or(c[k+1],z1,z2,z3);
end
endgenerate 
endmodule