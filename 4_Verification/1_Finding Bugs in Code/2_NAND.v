module top_module (input a, input b, input c, output out);//

    wire out_and;
    andgate inst1 ( .out(out_and), .a(a), .b(b), .c(c) , .d(1), .e(1));
    assign out = ~out_and;
endmodule
