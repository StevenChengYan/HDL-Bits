module top_module ( output reg A, output reg B );//

    //Absolute time
    initial #0  A = 0;
	initial #10 A = 1;
    initial #20 A = 0; 

    initial #0  B = 0;
	initial #15 B = 1;
    initial #40 B = 0;

    //Relative time
    /*
    initial begin
    A = 0;
	#10 A = 1;
    #10 A = 0;
    end
    
    initial begin
    B = 0;
	#15 B = 1;
    #25 B = 0;
    end
	*/
endmodule
