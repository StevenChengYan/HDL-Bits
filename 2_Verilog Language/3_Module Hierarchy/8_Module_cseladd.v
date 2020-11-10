module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout_sel;
    wire [15:0] sum_src1, sum_src2;
    
    add16 a0(a[15:0], b[15:0], 0, sum[15:0], cout_sel);
    add16 a1(a[31:16], b[31:16], 0, sum_src1[15:0], );
    add16 a2(a[31:16], b[31:16], 1, sum_src2[15:0], );
    
    assign sum[31:16] = cout_sel ? sum_src2 : sum_src1;
    /*
    always@(cout_sel) begin
    if (cout_sel == 0)
        sum[31:16] = sum_src1[15:0];
    else
        sum[31:16] = sum_src2[15:0];
    end
    */
endmodule
