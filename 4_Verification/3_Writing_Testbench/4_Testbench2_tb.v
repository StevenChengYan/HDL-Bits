module top_module();

    reg clk;
    reg in;
    reg[2:0] s;
    wire out;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    
    initial begin
    	in = 0;
        #20 in = 1;
        #10 in = 0;
        #10 in = 1;
        #30 in = 0;
    end
    
    initial begin
        #0 s = 2;
        #10 s = 6;
        #10 s = 2;
        #10 s = 7;
        #10 s = 0;
    end
    
    q7 inst(.clk(clk), .in(in), .s(s), .out(out));
endmodule
