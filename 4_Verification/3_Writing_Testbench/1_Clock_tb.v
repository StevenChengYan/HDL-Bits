module top_module ( );

    //input use reg, output use wire
    reg clk = 0;
    
    dut dut1(.clk(clk));
    
    //method 1
    /* 
    initial begin
        clk = 0;
    	forever #5 clk = ~clk;       
    end
    */
    
    //method 2
    always #5 clk = ~clk;  

endmodule
