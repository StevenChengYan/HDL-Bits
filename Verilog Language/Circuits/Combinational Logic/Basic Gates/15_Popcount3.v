module top_module( 
    input [2:0] in,
    output [1:0] out );
	
    int i, count;
    always@(*) begin
        count = 0;
        for(i=0; i<3; i++)begin
            if(in[i] == 1) count ++;
        end
    end
    assign out = count;
        
endmodule
