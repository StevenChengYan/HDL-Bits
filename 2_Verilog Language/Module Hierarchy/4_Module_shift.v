module top_module ( input clk, input d, output q );
	
    wire w1q, w2q;
    my_dff (.clk(clk), .d(d), .q(w1q));
    my_dff (.clk(clk), .d(w1q), .q(w2q));
    my_dff (.clk(clk), .d(w2q), .q(q));
    
endmodule
