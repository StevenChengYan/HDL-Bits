module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_out;
    wire carry_out;
    
    assign b_out = sub ? ~b : b;
    
    add16 a0(a[15:0], b_out[15:0], sub, sum[15:0], carry_out);
    add16 a1(a[31:16], b_out[31:16], carry_out, sum[31:16],);
    
endmodule
