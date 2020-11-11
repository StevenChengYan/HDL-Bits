module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    //assign out = ~b&c | a;
    assign out = (a | c) & (a | ~b);
endmodule
