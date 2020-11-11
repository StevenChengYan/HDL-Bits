module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always@(posedge clk) begin
        if(reset) 
            q <= 0;
        else if(q > 8)
            q <= 0;
        else begin
            if(slowena)
            	q <= q+1; 
        end
           
    end

endmodule