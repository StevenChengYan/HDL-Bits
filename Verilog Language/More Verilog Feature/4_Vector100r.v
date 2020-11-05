module top_module( 
    input [99:0] in,
    output [99:0] out
);
	integer i;
    always@(*) begin
        for(i=0; i<100; i++)
        begin
            out[i] = in[100-i-1];
        end
    end
endmodule
