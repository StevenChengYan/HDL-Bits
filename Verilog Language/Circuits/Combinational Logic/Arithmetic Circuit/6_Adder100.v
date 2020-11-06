module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );

    wire [99:0] co_wire;
    fadd f0 (a[0], b[0], cin, co_wire[0], sum[0]);
    fadd f[99:1] (a[99:1], b[99:1], co_wire[98:0], co_wire[99:1], sum[99:1]);
    
    assign cout = co_wire[99];
    
endmodule

module fadd(
	input a, b,
    input cin,
    output cout,
    output sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
