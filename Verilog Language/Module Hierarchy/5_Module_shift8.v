module my_mux (
    input [1:0] sel,
    input [7:0] ch0,
    input [7:0] ch1,
    input [7:0] ch2,
    input [7:0] ch3,
    output [7:0] out
);
    
    always @(*)
        begin
            case(sel) 
                0: out <= ch0;
                1: out <= ch1;
                2: out <= ch2;
                3: out <= ch3;
            endcase
        end
      
endmodule

module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1, w2, w3;
    
    my_dff8 (.clk(clk), .d(d),  .q(w1));
    my_dff8 (.clk(clk), .d(w1), .q(w2));
    my_dff8 (.clk(clk), .d(w2), .q(w3));
	
	my_mux (.sel(sel), .ch0(d), .ch1(w1), .ch2(w2), .ch3(w3), .out(q));
endmodule
