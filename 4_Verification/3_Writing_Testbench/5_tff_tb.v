module top_module ();
    
    reg clk;
    reg reset;
    reg t;
    wire q;
    
    initial begin
       clk = 0;
       forever #2 clk = ~clk;
    end
    
    initial begin
       reset = 1;
       t = 0;
       #4
       reset = 0;
       t = 1;      
    end
    
    tff inst(
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

endmodule
